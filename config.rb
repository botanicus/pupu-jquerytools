# encoding: utf-8

# dependencies of the pupu
dependency :jquery

File.join(File.dirname(__FILE__), "javascripts").tap do |path|
  options = Dir["*.js"].map { |path| File.basename(path).sub(/\.js$/, "").to_sym }
end

# pupu :jquerytools
# pupu :jquerytools, plugins: [:expose, :overlay]
parameter(:plugins) do |array|
  if array.nil?
    raise ArgumentError,
      "You have to specify which plugins from jQuery Tools you want to use!"
  else
    array.each do |plugin|
      begin
        javascript plugin
        stylesheet plugin
      rescue Pupu::AssetNotFound
      end
    end
  end
end
