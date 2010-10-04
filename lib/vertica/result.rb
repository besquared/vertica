module Vertica
  class Result
    include Enumerable
    
    def initialize(field_descriptions, field_values)
      @field_descriptions = field_descriptions
      @field_values = field_values
    end
    
    def columns
      @columns ||= @field_descriptions.map { |fd| Column.new(fd[:type_modifier], fd[:format_code], fd[:table_oid], fd[:name], fd[:attribute_number], fd[:data_type_oid], fd[:data_type_size]) }
    end
    
    def rows
      @rows ||= @field_values.map do |fv|
        index = 0
        fv.map do |f|
          index += 1
          self.columns[index-1].convert(f[:value])
        end
      end
    end
    
    def length
      @length ||= @field_values.length
    end
    
    def [](index)
      rows[index]
    end
    
    def first
      self[0]
    end
    
    def last
      self[length - 1]
    end
  end
end
