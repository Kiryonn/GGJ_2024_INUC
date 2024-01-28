class_name Takodachi extends CharacterBody2D

signal cookie_update(nb_cookies: int)

@onready var animation_player: AnimationPlayer = $AnimationPlayer

const SPEED :float = 300.0

var collected_cookies :int = 0

func _physics_process(delta: float) -> void:
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "up", "down")
	if direction:
		velocity = direction * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.y = move_toward(velocity.y, 0, SPEED)
	move_and_slide()
	_animate(delta)

func _animate(_delta: float) -> void:
	if not velocity:
		animation_player.stop(true)
		return
	if velocity.x >= 0:
		animation_player.play("move_right")
	elif velocity.x < 0:
		animation_player.play("move_right", -1, -1)



func _on_interaction_area_entered(area: Area2D) -> void:
	var area_owner = area.owner
	match area_owner.name:
		"Cookie":
			collected_cookies += 1
			area_owner.queue_free()
			%NbCookies.text = str(collected_cookies)
