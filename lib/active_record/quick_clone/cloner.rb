module ActiveRecord
  module QuickClone
    class Cloner
      ATTRIBUTE_CLASSES = %w(String Symbol).freeze

      ABSOLUTE_EXCLUDE = [
        :id,
        :created_at,
        :updated_at
      ].freeze

      SINGULAR_ASSOCIATIONS = [
        :has_one,
        :belongs_to
      ].freeze

      def self.clone_from(original_object, filter)
        new(original_object, filter).clone
      end

      def initialize(original_object, filter)
        @filter = filter

        @original_object = original_object
        @new_object = original_object.class.new
      end

      def clone
        determine_clone(@original_object, @new_object, @filter)
        @new_object
      end

      private

      def determine_clone(original_object, new_object, filter)
        filter.each do |field|
          if ATTRIBUTE_CLASSES.include? field.class.name
            next if ABSOLUTE_EXCLUDE.include?(field.to_sym)
            copy_attribute(original_object, new_object, field)
          elsif field.is_a? Hash
            field.each do |association_name, association_filter|
              copy_association(original_object, new_object, association_name, association_filter)
            end
          end
        end
      end

      def copy_attribute(original_object, new_object, field)
        new_object.send("#{field}=", original_object.send(field))
      end

      def copy_association(original_object, new_object, association_name, association_filter)
        if SINGULAR_ASSOCIATIONS.include?(original_object.class.reflect_on_association(association_name).macro)
          determine_clone(original_object.send(association_name),
                          new_object.send("build_#{association_name}"),
                          association_filter)
        else
          original_object.send(association_name).each do |association_original_object|
            determine_clone(association_original_object, new_object.send(association_name).build, association_filter)
          end
        end
      end
    end
  end
end
