extends VideoPlayer
func _process(delta):
	var isPlaying = is_playing()
	if isPlaying == false:
		play()

	pass

func _ready():
	# Called every time the node is added to the scene.
	# Initialization here
	set_process(true)


	set_autoplay(true)
	print('Autoplay set to true')

	print(has_autoplay())
	pass
