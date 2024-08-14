# A systems biology analysis of tuberculosis mouse models

This was my final project of the class 20.260 Computational Analysis of Biological Data I took at MIT in Spring 2024.
For our final project, we were tasked to use the dataset of a recently published paper and apply new computational
approaches to extract new, biologically significant hypotheses that the authors had not reached. Since I had not explored any 
tuberculosis (TB) research before, I chose to read the paper [*Mouse transcriptome reveals potential signatures of protection and pathogenesis in human tuberculosis*](https://doi.org/10.1038/s41590-020-0610-z) by Moreira-Teixeira et al. 

We had recently learned a new set of tools including SVD, PCA, regression (MLR, PCR, PLSR), classification, and single cell sequencing data analysis (UMAP, t-SNE) in the second semester of the class.
Intrigued by the potential of applying machine learning models to bulk-RNA seq data, I ended up using mainly PCA, PLSR, k-means cross validation, and supervised/unsupervised clustering to infer new hypotheses. The following is a brief summary of my work, although for an in-depth writeup and figures, please view the PDF in this repo. For loading the dataset, I used R,
and for model creation and validation, I used Python.

## Phase 1: Predicting the tuberculosis strain that caused infection

One of the tricky features of tuberculosis which makes it difficult to eradicate is its rapid
evolution of resistance to antibiotics. While current TB treatment involves intense rounds of
all-encompassing antibiotics, in the future, knowing which TB strain infected an individual could
mean that they are prescribed a strain-specific treatment, which could prove to be simultaneously
more effective on eradicating the disease and be less taxing on the body. With this idea in mind, I
wanted to uncover which set of mouse transcriptomic data, blood or lung, would best predict the
strain of TB the mouse was infected with: HN878, the clinical isolate, or H37Rv, the laboratory
strain. 

I created PLS-DA models for both datasets. After 10-fold cross validation, the accuracy score for the models were 0.721 and 0.688 respectively, 
for blood and lung datasets. 

Moreira-Teixeira et al. (2020) infected the experimental mice via an inhalation exposure system, and TB usually manifests in the lungs for
humans. Therefore, I initially expected the PLS-DA model trained on lung data to be more accurate than
the model trained on blood data, but the systems biology analysis proved otherwise. This
contradiction could be explained either by the uniqueness of this specific dataset, or possibly by
a hypothesis that TB infection from any strain impacts the lungs in a similar fashion, but
strain-specific effects might manifest more clearly by biomarkers in the bloodstream.

## Phase 2: Predicting the tuberculosis disease state

Another aspect of TB that remains to be known is the characteristics that make one
individual experience *latent* TB infection instead of *active* TB infection. For the second phase of
my project, I explored the legitimacy of developing a predictive model on the severity of a
human’s disease state from their blood transcriptomic data. The data sourced from Singhania, et
al. (2018) included data from a sample set in London and another in South Africa.

I wished to examine how a PLS-DA model trained on the London data would perform to predict
the outcome of the South Africa data. I was curious to see if the differences in geography and
human diversity would preclude the ability to create a useful predictive model for TB disease
state. 

Upon using the South Africa data as my test
dataset, the model was shown to have 0.745 accuracy. It was surprising to see such a highly accurate model, which may suggest that the TB disease
state in humans manifests similarly across continents and is not dependent on individual
physiology.

## Next steps

I would be remiss not to mention the potential of performing cross-species translation
using the data from Moreira-Teixeira et al. (2020). It is true that the mouse and human genome
differ widely, but using a method like [TransCompR](https://pubmed.ncbi.nlm.nih.gov/32753478/) to map mouse transcriptomic data onto
human transcriptomic data could help us develop even more accurate pre-clinical models of
various tuberculosis disease states.

## Conclusions

In the future, I envision that these regression models have the potential to become robust
and even assist physicians who are busy treating patients. These models could help inform what
kinds of prescriptive treatment are ideal for any given patient and help give a more accurate
prognosis to the patient and their family. Tuberculosis continues to be a disease that ravages
humankind, but with the right tools and creativity, we can confidently be on our way to
addressing and eradicating it entirely.


## Citations

Moreira-Teixeira, L., Tabone, O., Graham, C.M. et al. Mouse transcriptome reveals potential
signatures of protection and pathogenesis in human tuberculosis. Nat Immunol 21,
464–476 (2020). https://doi.org/10.1038/s41590-020-0610-z

Singhania, A., Verma, R., Graham, C.M. et al. A modular transcriptional signature identifies
phenotypic heterogeneity of human tuberculosis infection. Nat Commun 9, 2308 (2018).
https://doi.org/10.1038/s41467-018-04579-w
