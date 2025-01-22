extends Stado_Base

func on_physics_process(delta):
	
	if Input.is_action_pressed("ui_up") and controlled_node.is_on_floor():
		controlled_node.GuyAnims.play("Guy_Jump")
		controlled_node.velocity.y = controlled_node.JUMP_VELOCITY
	
	if controlled_node.velocity.y == 0:
		state_machine.change_to("PLAYER_IDLE")
	
	if not controlled_node.is_on_floor():
		controlled_node.velocity += controlled_node.get_gravity() * delta
	controlled_node.move_and_slide()
	
