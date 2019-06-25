function random_color_scheme
	if test -z $color_scheme_file
		set -g color_scheme_file "$HOME/.config/fish/color_schemes.yaml"
	end

	ruby -r yaml -e "a = YAML.load(File.read('$color_scheme_file')).to_a.sample;\
	puts \"set -gx COLOR_SCHEME #{a[0]};\n#{a[1].to_a.map{|i| %(set -gx #{i[0]} #{i[1]})}.join(%(;\n))}\""
end
