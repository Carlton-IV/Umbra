shader_type canvas_item;

uniform float alpha = 0.0;

uniform sampler2D SCREEN_TEXTURE:hint_screen_texture, filter_linear_mipmap;

void fragment() {
	vec4 data = texture(SCREEN_TEXTURE, SCREEN_UV).rgba;
	vec4 invers = vec4(1.0 - data.r, 1.0 - data.g, 1.0 - data.b, alpha);
	COLOR = invers;
}
