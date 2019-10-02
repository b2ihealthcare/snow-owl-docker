node('docker') {

	def classifier = "${SERVER_CLASSIFIER}"

	stage('Checkout repository') {
		checkout scm
	}

	stage('Fetch artifact') {
		withMaven(maven: 'Maven 3.6.0', mavenSettingsConfig: '895dc1f0-42a1-4b7d-8b6c-20f93e45e9b8') {
			if (classifier?.trim()) {
				sh "mvn clean verify -P repositories -Dserver.artifactId=${SERVER_ARTIFACT_ID} -Dserver.version=${SERVER_VERSION} -Dserver.groupId=${SERVER_GROUP_ID} -Dserver.classifier=${SERVER_CLASSIFIER} -Dserver.file.type=${SERVER_FILE_TYPE}"
			} else {
				sh "mvn clean verify -P repositories -Dserver.artifactId=${SERVER_ARTIFACT_ID} -Dserver.version=${SERVER_VERSION} -Dserver.groupId=${SERVER_GROUP_ID} -Dserver.file.type=${SERVER_FILE_TYPE}"
			}
			
		}
	}
	
	stage('Build and push image') {
		docker.withRegistry('https://snowowl.b2i.sg:8083', 'nexus_credentials') {
			
			def image
			
			if (classifier?.trim()) {
				image = docker.build("${SERVER_ARTIFACT_ID}-docker:${SERVER_VERSION}-${SERVER_TYPE}", "-f src/Dockerfile --build-arg SERVER_ARCHIVE=${SERVER_ARTIFACT_ID}-${SERVER_VERSION}-${SERVER_CLASSIFIER}.${SERVER_FILE_TYPE} .")
			} else {
				image = docker.build("${SERVER_ARTIFACT_ID}-docker:${SERVER_VERSION}-${SERVER_TYPE}", "-f src/Dockerfile --build-arg SERVER_ARCHIVE=${SERVER_ARTIFACT_ID}-${SERVER_VERSION}.${SERVER_FILE_TYPE} .")
			}
			
			image.push()
			
		}
	}

}