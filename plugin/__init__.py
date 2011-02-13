#!/usr/bin/python

import rb
import rhythmdb
#import gtk
import pause
#import time

class two_second_pause (rb.Plugin):

    def __init__(self):
        rb.Plugin.__init__(self)

    def activate(self, shell):
        # pause playback
        #shell.props.shell_player.pause()
				#pause = pause.Base(shell)
	
				#	time.sleep(2)

				print "Loop: %i" % counter

							

				#entry = pause.shell.get_player().get_playing_entry()
				#db = pause.shell.props.db
        #title=db.entry_get(entry, rhythmdb.PROP_TITLE)
				## IC - better to use rhythmdb.PROP_ENTRY_ID eventually
				#song = "How Does It Make You Feel?"

				#if title==song:
        #	pause.shell.props.shell_player.pause()

    def deactivate(self, shell):
        # start the song again
        #shell.props.shell_player.play()
        del shell
				del entry
				del db
				del title
