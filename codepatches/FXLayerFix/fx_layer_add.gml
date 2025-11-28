instance_create_depth(0, 0, -10, gameplayhud);
chromaLayer=layer_get_id("Fx_chroma")
redLayer = layer_create(-2300, "FX_red");
twirlLayer = layer_create(-2200, "FX_twirl");
posterizeLayer = layer_create(-2100, "FX_posterize");
edgeLayer = layer_create(-2000, "FX_edge");
hueLayer = layer_create(-1900, "FX_hue");
underwaterLayer = layer_create(-1400, "FX_underwater");
zoomLayer = layer_create(300, "FX_zoom");

layer_set_fx(redLayer, fx_create("_filter_colourise"));
layer_set_fx(twirlLayer, fx_create("_filter_twirl_distort"));
layer_set_fx(posterizeLayer, fx_create("_filter_posterise"));
layer_set_fx(edgeLayer, fx_create("_filter_edgedetect"));
layer_set_fx(hueLayer, fx_create("_filter_hue"));
layer_set_fx(underwaterLayer, fx_create("_filter_underwater"));
layer_set_fx(zoomLayer,fx_create("_filter_zoom_blur"));
layer_set_visible(chromaLayer, 0);
layer_set_visible(redLayer, 0);
layer_set_visible(posterizeLayer, 0);
layer_set_visible(edgeLayer, 0);
layer_set_visible(hueLayer, 0);
layer_set_visible(underwaterLayer, 0);
layer_set_visible(zoomLayer, 0);