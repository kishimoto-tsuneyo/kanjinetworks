#!/usr/bin/env ruby

JAPANESE_APP_NOTES_PATH = File.join File.dirname(__FILE__), 'test.japanese'
TEXT_NOTES_PATH = File.join File.dirname(__FILE__), 'notes.txt'

require 'zlib'
require 'json'

text = Zlib::GzipReader.open JAPANESE_APP_NOTES_PATH, &:read
records = JSON.parse(text)['notes'].values.map {|h| h['text'].gsub(/\s+/, ?\s) }

File.open(TEXT_NOTES_PATH, 'w') do |file|
  file.puts records
end
