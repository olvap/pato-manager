#!/usr/bin/env ruby
require './config/application'
require 'commander/import'

program :name, 'Todos'
program :version, '0.0.1'
program :description, 'A console application to keep tracking of your todo lists'

command :new do |c|
  c.syntax = ' new [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    Task.create name: args.join(' ')
  end
end

command :all do |c|
  c.syntax = ' all [options]'
  c.summary = ''
  c.description = ''
  c.example 'description', 'command example'
  c.option '--some-switch', 'Some switch that does something'
  c.action do |args, options|
    Task.all.each do |task|
      say "name: #{ task.name }"
    end
  end
end
