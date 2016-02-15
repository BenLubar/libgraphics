shared_flags= -m32 -g -D_GLIBCXX_USE_CXX11_ABI=0 -std=gnu++0x -Wall -Wextra
libs=gtk+-2.0 SDL_ttf SDL_image gl glew
CXXFLAGS+=$(shared_flags) $(shell i686-linux-gnu-pkg-config --cflags $(libs))
LDFLAGS+=$(shared_flags) -ldl -lz $(shell i686-linux-gnu-pkg-config --libs $(libs))
objects=KeybindingScreen.o ViewBase.o basics.o command_line.o enabler.o enabler_input.o files.o find_files_posix.o graphics.o init.o interface.o keybindings.o music_and_sound_openal.o random.o resize++.o textlines.o textures.o ttf_manager.o win32_compat.o

libgraphics.so: $(objects)
	$(CXX) -shared -Wl,--start-group $(LDFLAGS) -o $@ $(objects)

clean:
	rm -f libgraphics.so $(objects)
.PHONY: clean
