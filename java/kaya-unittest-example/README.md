## How to set this up

I generated this skeleton by doing this:

    mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DgroupId=com.example -DartifactId=kaya-unittest-example -DinteractiveMode=false

## Running

    mvn clean compile exec:java

## Running unit tests

    mvn test