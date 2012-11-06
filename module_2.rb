module Attributable
  def attribute_names
    self.instance_variables.map do |var|
        var.to_s.sub("@", "")
      end
  end

  def attributes
    attribute_names.map do |att_name|
        self.send(att_name.to_sym)
      end
  end
end

module Persistable
  def save
    Database.new.insert_record(self.class.table, self.attribute_names, self.attributes)
  end
end
