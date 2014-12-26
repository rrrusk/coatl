class Coatl
rule
	target  : /* none */ {result = 0}
					| string

	string  : DATA {result = data(val[0])}
					| COMPONENTS {result = component(val[0])}
					| FOR string ENDFOR {result = for_coatl(val[0][0],val[0][1],val[1])}
					| STRING
					| string string {result << val[1]}
end
