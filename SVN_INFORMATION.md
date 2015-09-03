# Introduction #

Jedai consists of both clientside and serverside code.  To accomplish this we have both a clientside Library project and a Serverside Library project.  In addition there is a repository for example code and unit tests.
<br />


&lt;hr/&gt;


<br />

<font color='#000'>
<h1>Jedai Build Framework (Building Jedai from Source)</h1>
</font>
<br />
<font color='#333'>
<h3>Jedai Build Framework</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.build <br />
Description: Based on the Antennae build system, this project builds the entire system from a standard set of targets.  To build the framework you simply enter into this project and issue "ant build".  To build a distribution, simply enter "ant dist".

<br />


&lt;hr/&gt;


<br />

<font color='#000'>
<h1>Jedai Clientside</h1>
</font>

<br />
<font color='#333'>
<h3>Jedai Clientside Network Framework</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.client <br />
Description: A Flex Library project that includes the Jedai Network Framework (JNF) and the Jedai Collaborative Framework (JCF) which consists of clientside flex ui components that will help in building real-time collaborative applications.
<br />
<font color='#333'>
<h3>Jedai Clientside Collaboration Framework</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.client.ui <br />
Description: A Flex Library project that includes the Jedai Collaborative Framework (JCF) which consists of clientside flex ui components that will help in building real-time collaborative applications.
<br />
<font color='#333'>
<h3>Jedai Clientside Example Project</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.example.client<br />
Description: Reference implementation of the clientside framework.
<br />
<font color='#333'>
<h3>Jedai Clientside Tests</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.client.test
Description: Consists of clientside Flex-unit tests.


<br />


&lt;hr/&gt;


<br />

<font color='#000'>
<h1>Jedai Serverside</h1>
</font>

<br />
<font color='#333'>
<h3>Jedai Serverside Library</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.server<br />
Desciption:

Note: If you have checked the serverside code out through SVN you can use this project as a serverside JEE library module which should be added to an existing Red5 webapp.  You can accomplish this by:
right click project -> select properties -> select "Java EE Module Dependencies" -> click Apply -> click OK
<br />
<font color='#333'>
<h3>Jedai Serverside Example Project</h3>
</font>
https://jedai.googlecode.com/svn/trunk/org.jedai.example.server<br />
Description: Reference implementation of the serverside framework.
<br />
<font color='#333'>
<h3>Jedai Serverside Tests</h3>
</font>
Description: TODO.