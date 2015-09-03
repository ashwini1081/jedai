#Explains the serverside directory structure.

# Introduction #

This page serves to explain the structure of the server including the additional items needed to build the server.  It should be noted that the serverside implementation is now a jar file that can be dropped into an existing web application.  Additionally, there are config files that must be placed in the web applications WEB-INF directory for jedai to be wired up at startup.  The following is a summary of the serverside directory structure along with descriptions of each element.

# Structure #

```
server/
  src/
    jedai/
      business/
        exceptions/
        templates/
      domain/
        security/
      enums/
      util/
      vo/
  META-INF/
  build/
  configs/
  lib/
  sql/
```


# server/ #
description: the top level project directory

---


# src/ #
description: source files

---


# META-INF/ #
description: manifest file

---


# build/ #
description:

---


# configs/ #
description: There are 6 configuration files located in the configs.
jdbc.properties
red5-jedai\_hibernate.xml
red5-jedai\_mail.xml
red5-jedai\_security.xml
red5-jedai\_services.xml
users.properties

These need to be dropped in the WEB-INF directory during a deploy


---


# lib/ #
description:

---


# sql/ #
description:

---


# Details #

Add your content here.  Format your content with:
  * Text in **bold** or _italic_
  * Headings, paragraphs, and lists
  * Automatic links to other wiki pages