globals [ infection-radius ]

turtles-own [ infected ]

to setup
  clear-all
  set infection-radius 1
  create-turtles 1000 [
    setxy random-xcor random-ycor
    set infected one-of [true false]
    set color ifelse-value infected [red] [blue]
  ]
  reset-ticks
end

to go
  ask turtles with [ infected ] [
    ask turtles in-radius infection-radius [
      if not infected [
        set infected true
        set color red
      ]
    ]
  ]
  tick
end
