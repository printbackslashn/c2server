import strutils
import sequtils
import std/net

# TODO Open listeners procedure
proc listen(command: seq[string] ): string =
    
    case command[0]
    of "help", "":
        echo "Usage: idk yet"
    of "rev_shell":
        let socket = newSocket()
        socket.bindAddr(Port(command[1].parseInt()))
        socket.listen()
    discard
# TODO Create agents procedure

# TODO Help command procedure
proc help() =
    let message: string = r"""
    A basic, generic, plain old help message.
    Done in raw triple quotes.
    Commands:
        - help      Display this message
        - listen    Start a listeners, run for more information."""
    echo message
    discard

# TODO Handle command procedure
proc handleCommand(command: string = "help") =
    var args = command.split({' '})
    var command = args[0]

    if args.len > 1:
        args.delete(0)
    else:
        args[0] = ""


    case command
    of "":
        help()
    of "help":
        help()
    of "listen":
        echo listen(args)
    discard

# TODO config file for settings
let start = true
# TODO Prompt menu
echo "Launching c2 server " # I should really find a name for this
while start:
    stdout.write(">>> ")
    var command = stdin.readLine()
    command.handleCommand()
echo "Hello"