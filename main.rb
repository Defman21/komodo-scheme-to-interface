#!/usr/bin/env ruby
require 'pp'
require_relative "scheme-to-interface/scheme-to-interface"

path_to_file = [(print "Enter path to ksf file: "), gets.rstrip][1]

type = [(print "What kind of scheme it is? (light/dark): "), gets.rstrip][1]

path_to_file.gsub! '~', "#{Dir.home}"

ksf = SchemeToInterface::Parser.parse_ksf path_to_file

colors = {
  '00' => nil,
  '01' => nil,
  '02' => nil,
  '03' => nil,
  '04' => nil,
  '05' => nil,
  '06' => nil,
  '07' => nil,
  '08' => nil,
  '09' => nil,
  '0a' => nil,
  '0b' => nil,
  '0c' => nil,
  '0d' => nil,
  '0e' => nil,
  '0f' => nil
}

ksf.fg.each_with_index do |color, index|
  colors_table = {
    0 => '0d',
    1 => '0e',
    2 => '0b',
    3 => '0a',
    4 => '08',
    5 => '09',
    6 => '0c',
    7 => '0f',
    8 => '07'
  }
  puts "Assigning #{color} to colors[#{colors_table[index]}]"
  colors[colors_table[index]] = color
end

colors['00'] = ksf.bg

case type
  when "light"
    [1,2,3].each do |i|
      amount = 1.0 - (i / 10.0).round(2)
      color = SchemeToInterface::Scheme.darken colors['00'], amount
      puts "Type: light, hex: 0#{i}, action: dark, amount: #{amount} -> #{color}"
      colors["0#{i}"] = color
    end
    [4,5,6].each do |i|
      amount = 0.3 + (i / 10.0).round(2)
      color = SchemeToInterface::Scheme.darken colors['07'], amount
      puts "Type: light, hex: 0#{i}, action: dark, amount: #{amount} -> #{color}"
      colors["0#{i}"] = color
    end
  when "dark"
    [1,2,3].each do |i|
      amount = (i / 10.0).round(2)
      color = SchemeToInterface::Scheme.lighten colors['00'], amount
      puts "Type: light, hex: 0#{i}, action: light, amount: #{amount} -> #{color}"
      colors["0#{i}"] = color
    end
    [6,5,4].each do |i|
      amount = 0.3 + (i / 10.0).round(2)
      color = SchemeToInterface::Scheme.darken colors['07'], amount
      puts "Type: light, hex: 0#{i}, action: dark, amount: #{amount} -> #{color}"
      colors["0#{i}"] = color
    end
end

puts "Current color table: "
pp colors

done = [(print "Is it good? [Y/n] "), gets.rstrip][1]

case done.downcase
  when "y", ""
    puts "Generating the final ksf file"
  when "n"
    abort "Aborting"
end

font_name = [(print "Please enter the font you want to use: "), gets.rstrip][1]
font_size = [(print "Please enter the font size: "), gets.rstrip][1]

template_values = colors.values
template_values << font_name << font_size

scheme_name = [(print "Enter scheme name: "), gets.rstrip][1]

file = File.new "./#{scheme_name}_s2i.ksf", "w"

file.write SchemeToInterface::Parser.ksf
file.write "\n"
file.write SchemeToInterface::Interface.template % template_values

file.close

abort "Done!"
