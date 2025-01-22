extends Node
class_name Stado_Base
# Hace referencia al nodo que vamos a controlar
@onready var controlled_node: Node = self.owner

# Referencia a la maquina de estados
var state_machine:StateMachine

# Region de metodos comunes

# Metodo que se ejecuta al entrar en el estado
func start():
	pass


func end():
	pass

# Region End
