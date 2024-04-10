resource "google_container_registry" "registry" {
  project  = var.project_id
  location = var.location
}

resource "google_cloudbuild_trigger" "build-trigger" {
  github {
    owner = "yandisa2005"
    name  = "yandisa2005/gcp-cloud-build-run"
    //Events section
    push {
      branch = "master"
      //or
      //tag    = "production"
    }
  }
  ignored_files = [".gitignore"]
  //Configuration section
  // build config file
  filename = "./cloudbuild.yaml"
  // build config inline yaml
  #build {
  #    step {
  #    name       = "node"
  #    entrypoint = "npm"
  #    args       = ["install"]
  #    }
  #    step{...}
  #    ...
  #  }
  //Advanced section
#  substitutions = {
#    <key1> = "<value1>"
#    <key2> = "<value2>"
#  }
}