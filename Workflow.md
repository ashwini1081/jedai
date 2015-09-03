workflow for starting up Jedai.

Workflow ( wrapped )

  1. create a NetConnection ( by config.xml )
  1. create a NetStream → Camera / Microphone & Video / Sound ( by app-context.xml via AMF with the “context” Red5Connection )
  1. attach everything together ( automated by app-context.xml via AMF )
  1. put everything on stage ( by Red5ConfigurationComplete Event or by Red5FlexApplication )
  1. Verify device connection, if connection cannot be verified ( to camera ) then we display a camera not found. If the Cookie is empty, display a device selector. Attributed to VideoOutputDevice ( ext. DisplayAdapter )


---


Session Steps

1. get an httpservice for the external config file

2. load up initial service

3. call the rtmp connection to get the spring config file

4. load up all remaining dependencies

5. kick off the app


---



How to get the security prompt with a Camera or a Microphone

Contrary to logic, you don’t receive the prompt when you just ask for an instance of Camera or Microphone. For instance:

var cam:Camera = Camera.getCamera(); //doesn’t prompt
var video:Video = new Video();
video.attachCamera(cam); // gets a prompt


---


Key Concepts

- Code against Interfaces and not Classes

- Framework-wide support for Deconstructors and dependency-unlinking

- Flex Components are built into the framework but are used in a way where we could implement the same functionality regardless of UI Framework.

- IOC Bean Configuration for preset config objs for StreamFactory by Prana

- For now we will use Cairngorm as our event-command paradigm.