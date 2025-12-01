#### Install uv dependency management system <br>
curl -LsSf https://astral.sh/uv/install.sh | sh<br>
uv pip compile requirements.in -o requirements.txt<br>
#### This creates a .venv folder in your current directory<br>
uv venv<br>
uv pip sync requirements.txt<br>
#### activate venv<br>
source .venv/bin/activate<br>

#### Test the chatbot locally:<br>
######  This chatbot does not use Neo4J, its just part of the setup for a future agent
###### To create a free Neo4j instance, go to console.neo4j.io and signup for a free instance
export OPENAI_API_KEY=<br>
export NEO4J_URI=<br>
export NEO4J_PASSWORD=<br>

streamlit run app.py<br>

#### Prepare your env for deployment on GCP<br>
Ref: https://docs.cloud.google.com/run/docs/setup<br>
gcloud config set project YOUR_PROJECT_ID

#### Enable cloud run
gcloud services enable run.googleapis.com

#### Create Container repo on GCP
gcloud artifacts repositories create {repo-name} \
        --repository-format=docker \
        --location={region} \
        --description={some desc}
        --immutable-tags \
        --async
#### Check the repo just created
gcloud artifacts repositories describe app-repo --location={region}

#### Configure the repo just created
gcloud auth configure-docker {region}-docker.pkg.dev<br>

#### Build the docker image on Cloud and push it to the repo created<br>
gcloud builds submit --tag {region}-docker.pkg.dev/{project-id}/{repo-name}/{image-name}:latest<br>

Ref: https://docs.cloud.google.com/run/docs/building/containers<br>

#### Deploy the docker image on Cloud run (Use 1GB RAM with 1 vCPU) <br>

Select the docker image on the dashboard in Cloud run Services page, select config of Cloud run and deploy as Service<br>
https://docs.cloud.google.com/run/docs/quickstarts/deploy-container<br>

#### Acknowledgements:
The code is adapted from the course : https://learn.deeplearning.ai/courses/agentic-knowledge-graph-construction 




