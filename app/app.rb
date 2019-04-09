require_relative 'controllers/rovers_controller'
require_relative 'router'

controller = RoversController.new

router = Router.new(controller)

router.run
