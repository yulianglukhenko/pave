module Pave
  module Shell
    def Shell.included base
      base.extend Shell
    end

    def shell(command)
      output = `#{command}`
      Struct.new(:status, :output).new($?, output)
    end

    def sh(command)
      result = shell(command)
      puts result.output
      result.status
    end 

    def sed(filename, command)
      sh "sed -i '.bak' '#{command}' #{filename}"
    end
  end
end
