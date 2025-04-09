

BASE_HREF = '/to_do_app/'
GITHUB_REPO = https://github.com/vlady04/to_do_app.git
BUILD_VERSION := $(shell grep 'version:' pubspec.yaml | awk '{print $$2}')

deploy-web:

	@echo "clean existing repository..."

	@echo "getting packages..."
	flutter pub get

	flutter build we --base-href $(BASE_HREF) -- release

	@echo "Deplying to git repository"
	cd build/web && \
	git ini && \
	git add . && \
	git commit -M main && \
	git remotr add origin $(GITHUB_REPO) && \
	git push -u --force origin main

	cd ../..
	@echo "Finished deploy"

.vlady04: deploy-web