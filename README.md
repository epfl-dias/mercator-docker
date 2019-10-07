# Docker Container for Mercator 

This Projects provides a couple of scripts to build and run it Mercator inside a docker container.

## Mercator: Spatial Index

**Mercator** is a spatial *volumetric* index for the [Human Brain Project](http://www.humanbrainproject.eu). It is a component of the [Knowledge Graph](http://www.humanbrainproject.eu/en/explore-the-brain/search/) service, which  provides the spatial anchoring for the metadata registered as well as processes the volumetric queries.

It is build on top of the Iron Sea database toolkit.

## Iron Sea: Database Toolkit

**Iron Sea** provides a set of database engine bricks, which can be combined and applied on arbitrary data structures.

Unlike a traditional database, it does not assume a specific physical structure for the tables nor the records, but relies on the developper to provide a set of extractor functions which are used by the specific indices provided.

This enables the index implementations to be agnostic from the underlying data structure, and re-used.

## Requirements

### Software

 * docker
 * git

## Quick start

1. **Building the container image**
	
	Clone the mercator workspace to a folder named `mercator` in the current directory, then use: 
	
	```sh
	./build.sh
	```

2. **Starting the container**
	
	```sh
	# ./run.sh <docker-compose commands>
	./run.sh up -d # to run the service as a deamon
	```

### Usage

You can customize a set of parameters with environment variables. To retrieve a full list of these, please take a look at `settings.default.sh`.

You can either overrides in the environment by exporting them before calling `run.sh`, adding them on the command line. For example: 

```sh
KG_SPATIAL_SEARCH_PORT="80" ./run.sh up -d
```

You can also override variables by setting them in `settings.local.sh`. It is recommanded to use the same format as the one foudn in `settings.default.sh` as this allows one-off overrides from the command line or environment.

## Acknowledgements

This open source software code was developed in part or in whole in the
Human Brain Project, funded from the European Union’s Horizon 2020
Framework Programme for Research and Innovation under the Specific Grant
Agreement No. 785907 (Human Brain Project SGA2).
