# [NOTE] Install opengl-bindings2 ( https://rubygems.org/gems/opengl-bindings2 ) before running this sample.
# $ gem install opengl-bindings2

require 'opengl'
require_relative '../lib/sdl2'
require_relative 'util'

include SDL2

$color =
  [[ 1.0,  1.0,  0.0].pack("D3"),
   [ 1.0,  0.0,  0.0].pack("D3"),
   [ 0.0,  0.0,  0.0].pack("D3"),
   [ 0.0,  1.0,  0.0].pack("D3"),
   [ 0.0,  1.0,  1.0].pack("D3"),
   [ 1.0,  1.0,  1.0].pack("D3"),
   [ 1.0,  0.0,  1.0].pack("D3"),
   [ 0.0,  0.0,  1.0].pack("D3")]

$cube =
  [[ 0.5,  0.5, -0.5].pack("D3"), 
   [ 0.5, -0.5, -0.5].pack("D3"),
   [-0.5, -0.5, -0.5].pack("D3"),
   [-0.5,  0.5, -0.5].pack("D3"),
   [-0.5,  0.5,  0.5].pack("D3"),
   [ 0.5,  0.5,  0.5].pack("D3"),
   [ 0.5, -0.5,  0.5].pack("D3"),
   [-0.5, -0.5,  0.5].pack("D3")]

def render()
  GL.ClearColor(0.0, 0.0, 0.0, 1.0)
  GL.Clear(GL::COLOR_BUFFER_BIT|GL::DEPTH_BUFFER_BIT)

  GL.Begin(GL::QUADS)

  GL.Color3dv($color[0])
  GL.Vertex3dv($cube[0])
  GL.Color3dv($color[1])
  GL.Vertex3dv($cube[1])
  GL.Color3dv($color[2])
  GL.Vertex3dv($cube[2])
  GL.Color3dv($color[3])
  GL.Vertex3dv($cube[3])

  GL.Color3dv($color[3])
  GL.Vertex3dv($cube[3])
  GL.Color3dv($color[4])
  GL.Vertex3dv($cube[4])
  GL.Color3dv($color[7])
  GL.Vertex3dv($cube[7])
  GL.Color3dv($color[2])
  GL.Vertex3dv($cube[2])

  GL.Color3dv($color[0])
  GL.Vertex3dv($cube[0])
  GL.Color3dv($color[5])
  GL.Vertex3dv($cube[5])
  GL.Color3dv($color[6])
  GL.Vertex3dv($cube[6])
  GL.Color3dv($color[1])
  GL.Vertex3dv($cube[1])

  GL.Color3dv($color[5])
  GL.Vertex3dv($cube[5])
  GL.Color3dv($color[4])
  GL.Vertex3dv($cube[4])
  GL.Color3dv($color[7])
  GL.Vertex3dv($cube[7])
  GL.Color3dv($color[6])
  GL.Vertex3dv($cube[6])

  GL.Color3dv($color[5])
  GL.Vertex3dv($cube[5])
  GL.Color3dv($color[0])
  GL.Vertex3dv($cube[0])
  GL.Color3dv($color[3])
  GL.Vertex3dv($cube[3])
  GL.Color3dv($color[4])
  GL.Vertex3dv($cube[4])

  GL.Color3dv($color[6])
  GL.Vertex3dv($cube[6])
  GL.Color3dv($color[1])
  GL.Vertex3dv($cube[1])
  GL.Color3dv($color[2])
  GL.Vertex3dv($cube[2])
  GL.Color3dv($color[7])
  GL.Vertex3dv($cube[7])

  GL.End()

  GL.MatrixMode(GL::MODELVIEW)
  GL.Rotated(5.0, 1.0, 1.0, 1.0)
end


if __FILE__ == $PROGRAM_NAME
  load_sdl2_lib()
  success = SDL_Init(SDL_INIT_EVERYTHING)
  exit if success < 0

  WINDOW_W = 640
  WINDOW_H = 360
  window = SDL_CreateWindow("OpenGL Window via sdl2-bindings", 0, 0, WINDOW_W, WINDOW_H, SDL_WINDOW_OPENGL)

  ratio = WINDOW_W.to_f / WINDOW_H

  context = SDL_GL_CreateContext(window)

  GL.load_lib()

  SDL_GL_SetSwapInterval(1)

  GL.Viewport(0, 0, WINDOW_W, WINDOW_H)
  GL.MatrixMode(GL::PROJECTION)
  GL.LoadIdentity()
  GL.Ortho(-ratio, ratio, -1.0, 1.0, -1.0, 1.0)
  GL.MatrixMode(GL::MODELVIEW)
  GL.LoadIdentity()

  GL.Enable(GL::DEPTH_TEST)
  GL.DepthFunc(GL::LESS)
  GL.ShadeModel(GL::SMOOTH)

  # w_buf = '    '
  # h_buf = '    '

  event = SDL_Event.new
  done = false
  while not done
    while SDL_PollEvent(event) != 0
      # 'type' and 'timestamp' are common members for all SDL Event structs.
      event_type = event[:common][:type]
      event_timestamp = event[:common][:timestamp]
      # puts "Event : type=0x#{event_type.to_s(16)}, timestamp=#{event_timestamp}"
      case event_type
      when SDL_KEYDOWN
        if event[:key][:keysym][:sym] == SDLK_ESCAPE
          done = true
        end
      end
    end

    SDL_GL_MakeCurrent(window, context)
    # SDL_GL_GetDrawableSize(window, w_buf, h_buf)
    # glViewport(0, 0, w_buf.unpack("S")[0], h_buf.unpack("S")[0])
    render()
    SDL_GL_SwapWindow(window)
  end

  SDL_GL_DeleteContext(context)
  SDL_DestroyWindow(window)
  SDL_Quit()
end
