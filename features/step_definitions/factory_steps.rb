module FactoryMethods
  def create_from_table(model_name, table, extra = {})
    factory_name = generate_factory_name(model_name)
    is_singular = model_name.to_s.singularize == model_name.to_s
    hashes = if is_singular
               [table.rows_hash]
             else
               table.hashes
             end
    klass = Factory.factories[factory_name].class_name.to_s.classify.constantize
    @they = hashes.map do |hash|
      hash = hash.merge(extra).inject({}) do |h,(k,v)|
        k = k.gsub(/\W+/,'_')
        v = v.split(/\s*,\s*/) if klass.serialized_attributes[k] == Array
        h.update(k.to_sym => v)
      end
      object = Factory.build(factory_name, hash)
      yield object if block_given?
      object.save!
      object
    end
    if is_singular
      @it = @they.last
      instance_variable_set("@#{factory_name}", @it)
    end
  end

  def generate_factory_name(model_name)
    model_name.gsub(/\W+/, '_').underscore.singularize.to_sym
  end
end

World(FactoryMethods)

Given %r{^the following (.+):$} do |model_name, table|
  create_from_table(model_name, table)
end
