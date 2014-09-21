<!--
  ~ Copyright (c) 2014 Kloudtek Ltd
  -->

<xsl:stylesheet version="1.0" xmlns:xsl="http://www.w3.org/1999/XSL/Transform">

    <xsl:template match="/pom">
<!--
  ~ Copyright (c) 2014 Kloudtek Ltd
  -->

#set( $github = $github.toLowerCase().startsWith('t') || $github.toLowerCase().startsWith('y') )
#set( $oss = $oss.toLowerCase().startsWith('t') || $oss.toLowerCase().startsWith('y') )
#set( $testng = $testng.toLowerCase().startsWith('t') || $testng.toLowerCase().startsWith('y') )
#set( $mockito = $mockito.toLowerCase().startsWith('t') || $mockito.toLowerCase().startsWith('y') )
<project xmlns="http://maven.apache.org/POM/4.0.0" xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance"
         xsi:schemaLocation="http://maven.apache.org/POM/4.0.0 http://maven.apache.org/xsd/maven-4.0.0.xsd">
    <modelVersion>4.0.0</modelVersion>
    <groupId>${groupId}</groupId>
    <artifactId>${artifactId}</artifactId>
    <version>${version}</version>
    <description>${description}</description>
    <url>https://github.com/Kloudtek/ktutils</url>
    <organization>
        <name>Kloudtek</name>
        <url>http://www.kloudtek.com</url>
    </organization>
#if( $github )
    <issueManagement>
        <system>Github</system>
        <url>https://github.com/kloudtek/${projectid}/issues</url>
    </issueManagement>
    <scm>
        <url>scm:git:git@github.com:Kloudtek/${projectid}.git</url>
        <connection>scm:git:git@github.com:Kloudtek/${projectid}.git</connection>
        <developerConnection>scm:git:git@github.com:Kloudtek/${projectid}.git</developerConnection>
    </scm>
#end
    <licenses>
#if( $oss )
        <license>
            <name>The Apache Software License, Version 2.0</name>
            <url>http://www.apache.org/licenses/LICENSE-2.0.txt</url>
        </license>
#else
        <license>
            <name>Kloudtek commercial license</name>
        </license>
#end
    </licenses>
    <dependencies>
        <dependency>
            <groupId>com.intellij</groupId>
            <artifactId>annotations</artifactId>
            <version>12.0</version>
            <scope>provided</scope>
        </dependency>
#if( $github )
        <dependency>
            <groupId>org.testng</groupId>
            <artifactId>testng</artifactId>
            <version>6.8.7</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>com.google.inject</groupId>
            <artifactId>guice</artifactId>
            <version>3.0</version>
            <scope>test</scope>
        </dependency>
        <dependency>
            <groupId>org.uncommons</groupId>
            <artifactId>reportng</artifactId>
            <version>1.1.4</version>
            <scope>test</scope>
            <exclusions>
                <exclusion>
                    <groupId>org.testng</groupId>
                    <artifactId>testng</artifactId>
                </exclusion>
            </exclusions>
        </dependency>
#{end}#if( $mockito )
        <dependency>
            <groupId>org.mockito</groupId>
            <artifactId>mockito-all</artifactId>
            <version>1.9.5</version>
        </dependency>
#end
    </dependencies>
    <reporting>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-project-info-reports-plugin</artifactId>
                <version>2.7</version>
                <configuration>
                    <dependencyLocationsEnabled>false</dependencyLocationsEnabled>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>cobertura-maven-plugin</artifactId>
                <version>2.6</version>
                <configuration>
                    <check/>
                    <formats>
                        <format>html</format>
                        <format>xml</format>
                    </formats>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-javadoc-plugin</artifactId>
                <version>2.9.1</version>
            </plugin>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>findbugs-maven-plugin</artifactId>
                <version>3.0.0</version>
                <configuration>
                    <xmlOutput>true</xmlOutput>
                    <xmlOutputDirectory>${project.build.directory}/site</xmlOutputDirectory>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-jxr-plugin</artifactId>
                <version>2.3</version>
                <configuration>
                    <linkJavadoc>true</linkJavadoc>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-report-plugin</artifactId>
                <version>2.17</version>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-pmd-plugin</artifactId>
                <version>3.2</version>
            </plugin>
            <plugin>
                <groupId>org.codehaus.mojo</groupId>
                <artifactId>dashboard-maven-plugin</artifactId>
                <version>1.0.0-beta-1</version>
            </plugin>
        </plugins>
    </reporting>
    <build>
        <plugins>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-compiler-plugin</artifactId>
                <version>3.1</version>
                <configuration>
                    <source>1.$jdk</source>
                    <target>1.$jdk</target>
                </configuration>
            </plugin>
            <plugin>
                <artifactId>maven-project-info-reports-plugin</artifactId>
                <version>2.7</version>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-javadoc-plugin</artifactId>
                <version>2.9.1</version>
                <executions>
                    <execution>
                        <id>attach-javadocs</id>
                        <goals>
                            <goal>jar</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-source-plugin</artifactId>
                <version>2.3</version>
                <executions>
                    <execution>
                        <id>attach-sources</id>
                        <goals>
                            <goal>jar</goal>
                        </goals>
                    </execution>
                </executions>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-surefire-plugin</artifactId>
                <version>2.5</version>
                <configuration>
                    <properties>
                        <property>
                            <name>usedefaultlisteners</name>
                            <value>false</value>
                        </property>
                        <property>
                            <name>listener</name>
                            <value>org.uncommons.reportng.HTMLReporter, org.uncommons.reportng.JUnitXMLReporter</value>
                        </property>
                    </properties>
                </configuration>
            </plugin>
            <plugin>
                <groupId>org.apache.maven.plugins</groupId>
                <artifactId>maven-site-plugin</artifactId>
                <version>3.4</version>
                <dependencies>
                    <dependency>
                        <groupId>org.apache.maven.doxia</groupId>
                        <artifactId>doxia-module-markdown</artifactId>
                        <version>1.6</version>
                    </dependency>
                </dependencies>
            </plugin>
        </plugins>
        <extensions>
            <extension>
                <groupId>org.springframework.build</groupId>
                <artifactId>aws-maven</artifactId>
                <version>5.0.0.RELEASE</version>
            </extension>
        </extensions>
    </build>
    <repositories>
        <repository>
            <id>kloudtek-oss-releases</id>
            <name>Kloudtek OSS releases</name>
            <url>https://s3.amazonaws.com/maven.kloudtek.com/release</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
        <repository>
            <id>kloudtek-oss-snapshots</id>
            <name>Kloudtek OSS snapshots</name>
            <url>https://s3.amazonaws.com/maven.kloudtek.com/snapshot</url>
            <releases>
                <enabled>false</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </repository>
#if( ! $oss )
        <repository>
            <id>kloudtek-releases</id>
            <name>Kloudtek private release</name>
            <url>s3://kloudtek-maven-private/release</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </repository>
        <repository>
            <id>kloudtek-snapshots</id>
            <name>Kloudtek private snapshots</name>
            <url>s3://kloudtek-maven-private/snapshot</url>
            <releases>
                <enabled>false</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </repository>
#end
    </repositories>
    <pluginRepositories>
        <pluginRepository>
            <id>kloudtek-oss-releases</id>
            <name>Kloudtek OSS releases</name>
            <url>https://s3.amazonaws.com/maven.kloudtek.com/release</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </pluginRepository>
        <pluginRepository>
            <id>kloudtek-oss-snapshots</id>
            <name>Kloudtek OSS snapshots</name>
            <url>https://s3.amazonaws.com/maven.kloudtek.com/snapshot</url>
            <releases>
                <enabled>false</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </pluginRepository>
#if( ! $oss )
        <pluginRepository>
            <id>kloudtek-releases</id>
            <name>Kloudtek private releases</name>
            <url>s3://kloudtek-maven-private/release</url>
            <releases>
                <enabled>true</enabled>
            </releases>
            <snapshots>
                <enabled>false</enabled>
            </snapshots>
        </pluginRepository>
        <pluginRepository>
            <id>kloudtek-snapshots</id>
            <name>Kloudtek private snapshots</name>
            <url>s3://kloudtek-maven-private/snapshot</url>
            <releases>
                <enabled>false</enabled>
            </releases>
            <snapshots>
                <enabled>true</enabled>
            </snapshots>
        </pluginRepository>
#end
    </pluginRepositories>
    <distributionManagement>
#if( $oss )
        <repository>
            <id>kloudtek-oss-releases</id>
            <name>Kloudtek OSS releases</name>
            <url>s3://maven.kloudtek.com/release</url>
        </repository>
        <snapshotRepository>
            <id>kloudtek-oss-snapshots</id>
            <name>Kloudtek OSS snapshots</name>
            <url>s3://maven.kloudtek.com/snapshot</url>
        </snapshotRepository>
#else
        <repository>
            <id>kloudtek-releases</id>
            <name>Kloudtek private releases</name>
            <url>s3://kloudtek-maven-private/release</url>
        </repository>
        <snapshotRepository>
            <id>kloudtek-snapshots</id>
            <name>Kloudtek private snapshots</name>
            <url>s3://kloudtek-maven-private/snapshot</url>
        </snapshotRepository>
#end
    </distributionManagement>
</project>
</xsl:template>

</xsl:stylesheet>