Represents the application stack for Jedai.

# Framework Stack #

Now that there exists a framework for building live communication applications (Jedai), most developers will need to understand how this framework fits in with their application design.  Below exists a diagram that I will try to explain.  From top-down, you start off with your Flash clientside application.  Your view and application specific domain sits on top of Jedai which represents the network layer between your client and Red5.  Jedai then uses the network api to handle many of the tasks related to the network.  After the calls are transferred over the Internet, Red5 receives the call and bubbles up the remote data to the Jedai layer which interprets and handles service side functionality such as account management, stream management, data management, etc...  Last, you have your application layer on the server to provide application specific functionality.

![http://jedai.googlecode.com/files/application_structure.png](http://jedai.googlecode.com/files/application_structure.png)