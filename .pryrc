Dir.glob('**/*.rb').each do |file|
  require "./#{file}"
end
