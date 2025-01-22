extends Node
class_name StateMachine
# Nodo que vamos a controlar
@onready var controlled_node = self.owner

# Estado por defecto
@export var default_state:Stado_Base

# Estado en ejecucion en cada momento
var current_state:Stado_Base = null

func _ready():
	call_deferred("_state_default_start")

func _state_default_start() -> void:
	current_state = default_state
	_state_start()

# Funsion que prepara las variable para el nuevo estado y lanza su start
func _state_start() -> void:
	prints("StateMachine", controlled_node.name, "start state", current_state.name)
	# Configuracion del estado
	current_state.controlled_node = controlled_node # Confi. el estado actual a partir del nodo controlado
	current_state.state_machine = self # Maquina de estados a la que pertence
	current_state.start()

# Metodo para cambiar de un estado a otro
func change_to(new_state:String) -> void:
	if current_state and current_state.has_method("end"): current_state.end()
	current_state = get_node(new_state)
	_state_start()

# Region de metodos que se ejecutan solos

func _process(delta: float) -> void:
	if current_state and current_state.has_method("on_process"):
		current_state.on_process(delta)

func _physics_process(delta: float) -> void:
	if current_state and current_state.has_method("on_physics_process"):
		current_state.on_physics_process(delta)


func _input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_input"):
		current_state.on_input(event)


func _unhandled_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_input"):
		current_state.on_unhandled_input(event)


func _unhandled_key_input(event: InputEvent) -> void:
	if current_state and current_state.has_method("on_unhandled_key_input"):
		current_state.on_unhandled_key_input(event)

#endRegion
