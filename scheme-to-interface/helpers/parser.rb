module SchemeToInterface
  class Parser

    @@ksf = ""

    @@raw_ksf = ""

    class << self

      def json
        @@ksf
      end

      def ksf
        @@raw_ksf
      end

      def parse_ksf(path)
        require 'tempfile'
        require 'open-uri'
        require 'json'

        file = Tempfile.new "ksf"
        file.close

        stream = open path

        IO.copy_stream stream, file.path


        exporter = <<-eos

import json
export = locals()
_export = {}
for l in export.keys():
    if l in ["export", "_export"]:
        continue
    if isinstance(export[l],dict):
        _export[l] = export[l]
print json.dumps(_export)
        eos

        file = open file.path, "a"
        @@raw_ksf = File.read file.path
        file.write exporter
        file.close

        @@ksf = SchemeToInterface::Scheme.new `python2 #{file.path}`
      end
    end # class << self
  end # Parser
end # SchemeToInterface
