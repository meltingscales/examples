## How to set this up

I generated this skeleton by doing this:

    mvn archetype:generate -DarchetypeGroupId=org.apache.maven.archetypes -DarchetypeArtifactId=maven-archetype-quickstart -DarchetypeVersion=1.4 -DgroupId=com.example -DartifactId=kaya-unittest-example -DinteractiveMode=false

## Running CLI

    mvn exec:java -Dexec.mainClass="net.kayarocks.banking.App"

## Running GUI panel

    mvn exec:java -Dexec.mainClass="net.kayarocks.banking.BankGUIPanel"

## Running unit tests

    mvn clean jacoco:prepare-agent install jacoco:report
    xdg-open target/site/jacoco/index.html
