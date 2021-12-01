#!/bin/bash
#name: Shiting Li
#script takes two parameters
#$1: The absolute path to your weka installation
#$2: The absolute path to the directory with the classes and files to train upon

cd $1
export CLASSPATH=$CLASSPATH:`pwd`/weka.jar:`pwd`/libsvm.jar
java weka.core.converters.TextDirectoryLoader -dir $2 > text_example.arff
java -Xmx1024m weka.filters.unsupervised.attribute.StringToWordVector  -i text_example.arff -o text_example_training.arff -M 2
java -Xmx1024m  weka.classifiers.meta.ClassificationViaRegression -W weka.classifiers.trees.M5P -num-decimal-places 4  -t  text_example_training.arff -d text_example_training.model -c 1
