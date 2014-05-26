dxf_height = 66.04;
dxf_width = 66.04;
text_height = 5;
base_height = 2;
target_height = 100;
target_width = 100;
corner_radius = 5;

module text () {
    linear_extrude (text_height)
    scale ([target_width / dxf_width, target_height / dxf_height])
    import ("12geeks-logo.dxf");
}

module base () {
    hull () {
        for (corner=[
                [corner_radius, corner_radius],
                [target_width - corner_radius, corner_radius],
                [corner_radius, target_height],
                [target_width - corner_radius, target_height - corner_radius]
            ])
        translate ([corner[0], corner[1], 0])
        cylinder (r=corner_radius, h=base_height);
    }
}


color ("white")
base ();

color ("black")
text ();
