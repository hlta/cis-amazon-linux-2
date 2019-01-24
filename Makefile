ANSIBLE_TEST_PLAYBOOK_FILE = playbook.yml
ANSIBLE_CONTAINER_PLAYBOOK_FILE = container.yml

symlink-role:
	@mkdir -p tests/roles 
	@rsync -a . tests/roles/cis-amazon-linux-2 --exclude 'tests/' --exclude '.git'

test: symlink-role syntax test-ansible-2.4

test-ansible-2.4:
	cd tests && ansible-playbook -i localhost, $(ANSIBLE_CONTAINER_PLAYBOOK_FILE) --e "test_ansible_version=2.4.6"

syntax:
	cd tests && ansible-playbook --syntax-check -i localhost, $(ANSIBLE_TEST_PLAYBOOK_FILE)
