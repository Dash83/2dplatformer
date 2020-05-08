use euclid::Vector2D;

#[derive(gdnative::NativeClass)]
#[inherit(gdnative::KinematicBody2D)]
pub struct Player {
    score: i32,
    speed: i32,
    jumpForce: i32,
    gravity: i32,
    drag: i32,
    velocity: Vector2D<f64, _>
}

#[gdnative::methods]
impl Player {
    fn _init(_owner: gdnative::KinematicBody2D) -> Self {
        Player{ 
            score: 0,
            speed: 200,
            jumpForce: 600,
            gravity: 800,
            drag: 20,
            velocity: Vector2D::zero()
        }
    }
}

fn init(handle: gdnative::init::InitHandle) {
    handle.add_class::<Player>();
}

godot_gdnative_init!();
godot_nativescript_init!(init);
godot_gdnative_terminate!();