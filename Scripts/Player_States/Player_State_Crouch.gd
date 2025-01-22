extends Stado_Base

func on_physics_process(delta):
	if Input.is_action_pressed("ui_down"):
		controlled_node.GuyAnims.play("Guy_Crouch")
		controlled_node.velocity.x = move_toward(controlled_node.velocity.x, 0, controlled_node.SPEED)
	
	if Input.is_action_just_released("ui_down"):
		state_machine.change_to("PLAYER_IDLE")
	
	
	if not controlled_node.is_on_floor():
		controlled_node.velocity = controlled_node.ger_gravity() * delta
	controlled_node.move_and_slide()
	
