extends Area2D




func _on_body_entered(body: Takodachi) -> void:
	$UI.show()




func _on_body_exited(body: Takodachi) -> void:
	$UI.hide()
