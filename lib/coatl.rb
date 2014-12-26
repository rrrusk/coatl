require 'parser.tab'
class Coatl
	def exec(source,path)
		@path = path
		parse(source)
	end

	def parse(source)
		require "strscan"
		s = StringScanner.new(source)
		@q = []

		until s.eos?
			case
			when s.scan(/{{/)
				s.scan(/(.*?)}}/m)
				@q.push [:DATA, s[1].strip]
			when s.scan(/{%/)
				s.scan(/(.*?)%}/m)
				arg = s[1].strip
				case arg
				when /for(.*?)in(.*)/
					@q.push [:FOR, [$1.strip, $2.strip]]
				when /endfor/
					@q.push [:ENDFOR, ""]
				else
					@q.push [:COMPONENTS, arg]
				end
			when s.scan(/./m)
				if @q[-1] && @q[-1][0] == :STRING
					@q[-1][1] << s[0]
				else
					@q.push [:STRING, s[0]]
				end
			end
		end
		@q.push [false, '$end']
		do_parse
	end

	def next_token
		@q.shift
	end

	def data(name)
		data_file = Dir.glob("#{@path}/data/#{name}.*")[0]
		begin
			data = open(data_file).read
		rescue
			data = "{{#{name}}}"
		end
		return data
	end

	def component(name)
		components = open("#{@path}/components/#{name}/#{name}.coa").read
		return components
	end

	def for_coatl(name, data, string)
		data_file = Dir.glob("#{@path}/data/#{data}.*")[0]
		case File.extname(data_file)
		when ".csv"
			data_list = csvparse(data_file)
		else
			data = open(data_file).read
		end
		for_string = ""
		data_list.each do |data|
			p data
			for_string << for_parse(name, data, string)
		end
		return for_string
	end

	def for_parse(name, data, string)
		s = StringScanner.new(string)
		until s.eos?
			case
			when s.scan(/{{ *#{name}(.+?) *}}/)
				p s[1]
				string.gsub!(s[0], s[1])
			else s.scan(/./m)
			end
		end
		return string
	end

	def csvparse(data_file)
		require "csv"
		csv = CSV.open(data_file)
		header = csv.shift
		data_list = []
		csv.each do |row|
			data_list.push Hash[header.zip(row)]
		end
		return data_list
	end
end
