describe ActiveRecord::QuickClone::Cloner do
  let(:user_name) { 'bitshifter' }
  let(:user_alias) { 'teamsleep' }
  let(:user) { User.create name: user_name, alias: user_alias }
  let(:pet1) { Pet.create name: 'test pet', user: user }
  let(:pet2) { Pet.create name: 'test pet 2', user: user }
  let(:role) { Role.create name: 'my_role' }

  before do
    UserRole.create user: user, role: role
  end

  describe '.clone_from record' do
    describe 'filter' do
      let(:user_clone) { described_class.clone_from(user, filter) }

      context 'with properties' do
        let(:filter) { [:name, :alias] }

        it 'is able to clones them' do
          expect(user_clone.name).to eql user_name
          expect(user_clone.alias).to eql user_alias
        end
      end

      context 'with has_many association and properties' do
        let(:filter) do
          [
            :name,
            :alias,
            { pets: [ :name ] }
          ]
        end

        before do
          pet1
          pet2
        end

        it 'is able to clone them' do
          cloned_pet = user_clone.pets.first
          other_cloned_pet = user_clone.pets.last

          expect(user_clone.name).to eql user.name
          expect(user_clone.alias).to eql user.alias
          expect(user_clone.alias).to eql user.alias
          expect(cloned_pet.name).to eql pet1.name
          expect(cloned_pet.user_id).to eql user_clone.id

          expect(other_cloned_pet.name).to eql pet2.name
          expect(other_cloned_pet.name).not_to be_blank
        end
      end

      context 'with has_many, belongs_to and properties' do
        let(:filter) do
          [
            :name,
            :alias,
            { pets: [ :name ] },
            :mood,
          ]
        end

        let(:mood_name) { 'ok' }
        let(:mood) { Mood.create name: mood_name }

        before do
          user.update mood: mood
          pet1
          mood
        end

        it 'is able to clone them' do
          cloned_pet = user_clone.pets.first

          expect(user_clone.mood).to eql user.mood
          expect(user_clone.mood_id).to eql user.mood_id
          expect(user_clone.mood.name).to eql mood_name

          expect(user_clone.name).to eql user.name
          expect(user_clone.alias).to eql user.alias
          expect(user_clone.alias).to eql user.alias
          expect(cloned_pet.name).to eql pet1.name
          expect(cloned_pet.user_id).to eql user_clone.id
        end
      end
    end
  end
end
