extends Stado_Base

func  on_physics_process(delta):
	controlled_node.GuyAnims.play("Guy_Idle")
	controlled_node.velocity.x = 0
	
	if  Input.get_axis("ui_left", "ui_right"):
		state_machine.change_to("PLAYER_RUNNING")
	elif Input.is_action_pressed("ui_up"):
		state_machine.change_to("PLAYER_JUMP")
	elif Input.is_action_pressed("ui_down"):
		state_machine.change_to("PLAYER_CROUCHED")
	
	if not controlled_node.is_on_floor():
		controlled_node.velocity += controlled_node.get_gravity() * delta
	controlled_node.move_and_slide()

	
