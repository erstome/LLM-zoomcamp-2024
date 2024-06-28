PROJECT_NAME = llm_zoomcamp

# Configure poetry to create the .venv folder locally
env_conf:
	poetry config virtualenvs.in-project true

# Configurations of the jupyter kernel
jupyter_kernel:
	poetry run python -m ipykernel install --user --name=$(PROJECT_NAME)

run_elasticsearch:
	docker run -it \
		--name elasticsearch \
		-p 9200:9200 \
		-p 9300:9300 \
		-e "discovery.type=single-node" \
		-e "xpack.security.enabled=false" \
		docker.elastic.co/elasticsearch/elasticsearch:8.4.3
