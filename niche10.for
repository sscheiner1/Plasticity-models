! ******** SET VARIABLES, ARRAYS, AND PARAMETER VECTORS *********
         REAL OPT1[ALLOCATABLE](:)      !Optimal phenotype for trait 1 in each deme
         REAL OPT2[ALLOCATABLE](:)      !Optimal phenotype for trait 2 in each deme
	 REAL STS[ALLOCATABLE](:)       !Standard deviation of selection function in each deme
	 REAL RALL[ALLOCATABLE](:,:,:)  !Initial random allelic values
	 REAL EOPT1[ALLOCATABLE](:)     !Optimal phenotype for traut 1 with temporal variation
	 REAL EOPT2[ALLOCATABLE](:)     !Optimal phenotype for traut 2 with temporal variation
	 REAL EOPTM[ALLOCATABLE](:)     !Mean of optimal phenotypes for traut 2 with temporal variation
         REAL EBASE[ALLOCATABLE](:)     !Baseline environment before habitat construction in each deme
         REAL ELAST[ALLOCATABLE](:)     !Environment noise component with habitat construction
	 REAL B1[ALLOCATABLE](:)        !Environmental effect on trait 1 plasticity allele in each deme
	 REAL BNEW1[ALLOCATABLE](:)     !Environmental effect on trait 1 plasticity with temporal variation
	 REAL B2[ALLOCATABLE](:)        !Environmental effect on trait 2 plasticity allele in each deme
	 REAL BNEW2[ALLOCATABLE](:)     !Environmental effect on trait 2 plasticity with temporal variation
         REAL BLAST[ALLOCATABLE](:)     !Environment noise component for plasticity with habitat construction
         REAL BBASE[ALLOCATABLE](:)     !Baseline environmental effect on trait plasticity before habitat selection
	 REAL OUTSMP[ALLOCATABLE](:)    !Output mean metapopulation variables
         REAL GENO[ALLOCATABLE](:,:,:)  !Individuals
	 REAL POPMEAN[ALLOCATABLE](:,:) !Mean deme values
	 REAL METAMEAN[ALLOCATABLE](:)  !Mean metapopulation values
	 REAL YOUNG[ALLOCATABLE](:,:)   !Offspring
         REAL TCONFIG                   !Effect of trait 1 on phenotype of trait 2
	 REAL ECONFIG                   !Effect of environment on phenotype of trait 2
         REAL PLCONFIG                  !Effect of environment 1 plasticity on phenotype of trait 2
         REAL CONSTR                    !Presence or absence of habitat construction
         REAL BASETYPE                  !Baseline habitat either gradient or not a gradient
         REAL MAXDHAB                   !Maximum per individual change in environment due to habitat construction
         REAL MAXBUILD                  !Maximum per deme (individual multiplier) change in the environment due to habitat construction
	 REAL MEANFIT                   !Mean fitness of the metapopulation
	 REAL MR                        !Initial migration rate
	 REAL MUTRATE                   !Mutation rate of plastic and nonplastic loci
	 REAL MUTVAR                    !Variance of mutation function of plastic and nonplastic loci
	 REAL MMFIT                     !Sum of mean fitness values across replicates
	 REAL MGMUT                     !Mutation rate of dispersal loci
	 REAL MIGVAR                    !Variance of mutation function of dispersal loci
         REAL MAXMIG                    !Maximum value of dispersal loci for island migration
	 REAL MBIAS                     !Initial allelic bias of nonplastic loci
         REAL PLBIAS                    !Initial allelic bias for plastic loci
	 REAL MIGRS(11)                 !Vector of steppingstone migration rates
	 REAL MIGRI(11)                 !Vector of island migration rates
	 REAL GRS(9)                    !Vector of slope values of continuous environmental gradient
	 REAL GRS2(9)                   !Vector of slope values of second continuous environmental gradient
	 REAL STE(7)                    !Vector of slope values of the effects of the environment on the plasticity loci
	 REAL MBIS(9)                   !Vector of initial allelic bias of nonplastic loci
	 REAL LINKAGE                   !Amount of genetic linkage
	 REAL LNK(5)                    !Vector of amount of genetic linkage
	 REAL ENO(12)                   !Vector of the amount of environmental noise
	 REAL ENO1(12)                  !Vector of the amount of environmental noise for single deme
	 REAL COSTER(13)                !Vector of cost of plasticity values
	 REAL CNO(7)                    !Vector of autocorrelation of environmental noise
	 REAL INSTAB(11)                !Vector of effect of plasticity on developmental noise
         REAL INDEV(11)                 !Vector of magnitude of random developmental noise
	 REAL CMOVE(8)                  !Vector of probability of dying during moving
         REAL FUZBIAS(11)               !Vector of amount of bias in environmental assessment
         REAL FUZZ(11)                  !Vector of errors in environmental assessment
         REAL HABDECAY(11)              !Vector of habitat decay rates
         REAL HCOST(11)                 !Vector of cost of habitat construction values
         DOUBLE PRECISION RMSUM[ALLOCATABLE](:)   !Sum of metapopulation parameters across replicates
	 DOUBLE PRECISION RMSUMSQ[ALLOCATABLE](:) !Sum of squares of metapopulation parameters across replicates
	 INTEGER MCOUNT[ALLOCATABLE](:) !Number of individuals in a deme before selection
	 INTEGER NCOUNT[ALLOCATABLE](:) !Number of individuals in a deme after selection
	 INTEGER NQ1[ALLOCATABLE](:)    !Queue for tracking individuals during mortality
	 INTEGER NQ2[ALLOCATABLE](:)    !Queue for tracking individuals during mortality
         INTEGER NGST[ALLOCATABLE](:)   !Number of steps of environmental gradient
	 INTEGER NPST[ALLOCATABLE](:)   !Number of steps of reaction norm
         INTEGER FCONFIG                !Relationship of traits to fitness
	 INTEGER ENVSAME                !If the two traits experience the same environmental variation
         INTEGER ENVMEAN                !If the environment of selection is the average of the two environments
         INTEGER STSAME                 !If the deme and reaction norms steps are the same for the two traits
         INTEGER PHSAME                 !If the developmental patterns are the same for the two traits
	 INTEGER GRD                    !Counter for environmental gradient vector
	 INTEGER STP                    !Counter for reaction norm vector
	 INTEGER SEED                   !Seed for random number generator
	 INTEGER VMLOCI                 !Initial genetic variation for nonplastic loci
	 INTEGER VPLLOCI                !Initial genetic variation for plastic loci
	 INTEGER BEFORE1                !Toggle for environmental variation before development for trait 1
	 INTEGER AFTER1                 !Toggle for environmental variation after development before selection for trait 1
	 INTEGER SPCORR1                !Toggle for spatial correlation of temporal variation for trait 1
	 INTEGER BEFORE2                !Toggle for environmental variation before development for trait 2
	 INTEGER AFTER2                 !Toggle for environmental variation after development before selection for trait 2
	 INTEGER SPCORR2                !Toggle for spatial correlation of temporal variation for trait 2
         INTEGER TCONSTR                !Toggle for timing of habitat construction
	 INTEGER TGEN                   !Number of generations per replicate
         INTEGER*4 MRL                  !Counter for migration rate vector
	 INTEGER*4 I                    !Deme ID
	 INTEGER*4 J                    !Individual ID
	 INTEGER*4 K                    !Allele ID
         CHARACTER GTYPE*4              !Shape of environmental gradient 
	 CHARACTER PLTYPE*4             !Shape of reaction norm
	 CHARACTER MIGTYPE*4            !Type of migration pattern
	 CHARACTER CHOICE*1             !Presence or absence of habitat choice
	 DATA MIGRS /0,0.05,0.07,0.09,0.1,0.12,0.2,0.3,0.5,0.8,0.9/         !Stepping-stone migration rates
         DATA MIGRI /0,0.04,0.14,0.24,0.34,0.44,0.54,0.64,0.74,0.84,1.0/    !Island migration rates
	 DATA ENO /0,0.05,0.1,0.15,0.2,0.25,0.3,0.35,0.4,0.45,0.5,0.55/     !Environmental noise for multiple demes
	 DATA ENO1 /0,0.5,1.0,1.5,2.0,2.5,3.0,3.5,4.0,4.5,5.0,5.5/          !Environmental noise for single deme 
	 DATA CNO /0.75,0.5,0.25,0,-0.25,-0.5,-0.75/                        !Correlation of environmental noise          
	 DATA COSTER /0,0.0001,0.0002,0.0003,0.0004,0.0005,0.0006,          !Cost of plasticity
     C	         0.0007,0.0008,0.0009,0.0010,0.0011,0.0012/
	 DATA INSTAB /0,0.04,0.08,0.12,0.16,0.2,0.24,0.28,0.32,0.36,0.4/    !Plasticity-linked developmental noise
         DATA INDEV /0,0.04,0.08,0.12,0.16,0.2,0.24,0.28,0.32,0.36,0.4/     !Random developmental noise
         DATA GRS /0.0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8/                     !Steepness of environmental gradient
         DATA GRS2 /-0.4,-0.3,-0.2,-0.1,0.0,0.1,0.2,0.3,0.4/                !Steepness of second environmental gradient
         DATA STE /0,0.01,0.02,0.03,0.04,0.05,0.06/                         !Steepness of reaction norm - plasticity scalar
	 DATA MBIS /0,0.25,0.5,0.75,1,1.25,1.5,1.75,2/                      !Amount of initial allelic bias
	 DATA LNK /0,0.25,0.5,0.75,1/                                       !Genetic linkage
         DATA CMOVE /0,0.1,0.2,0.3,0.4,0.5,0.6,0.7/                         !Survival cost of dispersal
         DATA FUZBIAS /-0.5,-0.4,-0.3,-0.2,-0.1,0,0.1,0.2,0.3,0.4,0.5/      !Bias in habitat assessment
         DATA FUZZ /0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1/                !Error in habitat assessment
         DATA HABDECAY /0,0.1,0.2,0.3,0.4,0.5,0.6,0.7,0.8,0.9,1.0/          !Rate of habitat decay
         DATA HCOST /0,0.001,0.002,0.003,0.004,0.005,0.006,                 !Cost of habitat construction
       C	         0.007,0.008,0.009,0.010/
!       DATA HCOST /0,0.004,0.008,0.012,0.016,0.020,0.024,                 !Cost of habitat construction
!      C	         0.028,0.032,0.036,0.040/
! 
! ******* SET OUTPUT FILE AND GET SIMULATION PARAMETERS ***************
       CALL INOUT
	 CALL TRANSOUT(NOTRANS)
	 CALL SIMPARAM(NDEME,CHOICE,MIGTYPE,NPOP,MAXPOP,NREP,MAXCRASH,
       C               MULCRASH,TGEN,OPTMEAN1,OFFSET1,OPTMEAN2,OFFSET2,
       C               WIDTH,MUTRATE,MGMUT,MUTVAR,
       C               MIGVAR,SEED,NPARAM,FCONFIG,TCONFIG,ECONFIG,
       C               PLCONFIG,ENVSAME,ENVMEAN,STSAME,PHSAME,CONSTR,
       C               BASETYPE,MAXDHAB,MAXBUILD)
!
! ******* WRITE SIMULATION PARAMETER METADATA TO OUTPUT FILES **********
         IF (NOTRANS.EQ.1) CALL TRANSMETA(NDEME,CHOICE,CONSTR,BASETYPE,
       C   FCONFIG,TCONFIG,ECONFIG,PLCONFIG,ENVSAME,ENVMEAN,MIGTYPE,NPOP,
       C     MAXPOP,NREP,OPTMEAN1,OFFSET1,OPTMEAN2,OFFSET2,WIDTH,MUTRATE,
       C                      MUTVAR,MGMUT,MIGVAR,MAXDHAB,MAXBUILD)
         CALL METADATA(NDEME,CHOICE,CONSTR,BASETYPE,FCONFIG,TCONFIG,
       C       ECONFIG,PLCONFIG,ENVSAME,ENVMEAN,MIGTYPE,NPOP,MAXPOP,NREP,
       C       TGEN,OPTMEAN1,OFFSET1,OPTMEAN2,OFFSET2,WIDTH,MUTRATE,
       C       MUTVAR,MGMUT,MIGVAR,MAXDHAB,MAXBUILD)
!
! ************ DIMENSION ARRAYS ***************
	 ALLOCATE (OPT1(NDEME),OPT2(NDEME),EBASE(NDEME),STS(NDEME),
       C           B1(NDEME),B2(NDEME),MCOUNT(NDEME),NCOUNT(NDEME),
       C           POPMEAN(NDEME,NPARAM),NQ1(MAXPOP),NQ2(MAXPOP),
       C           EOPT1(NDEME),EOPT2(NDEME),EOPTM(NDEME),ELAST(NDEME),
       C           BNEW1(NDEME),BNEW2(NDEME),BBASE(NDEME),BLAST(NDEME),
       C           METAMEAN(NPARAM),RMSUM(NPARAM),RMSUMSQ(NPARAM),
       C           OUTSMP((2*NPARAM)))
!
! ******* BEGIN LOOPING PARAMETER COMBINATIONS ********
!
! ******* SET LIFE HISTORY *******
! ******* SET TYPE OF SELECTIVE REPRODUCTION (1 = soft, 2 = hard)
         DO 25 NSH = 1,1
! ******* SET MOVEMENT-SELECTION ORDER (1 = move first, 2 = select first) ******
         DO 24 MS = 1,1
!
! ******* ESTABLISH GENOMIC ARCHITECTURE *******
! ******* NM1LOCI = NUMBER OF MEAN ONE LOCI ******
         DO 193 NM1LOCI = 5,5
! ******* NM12LOCI = NUMBER OF MEAN ONE+TWO LOCI ******
         DO 192 NM12LOCI = 0,0
! ******* NM2LOCI = NUMBER OF MEAN TWO LOCI ******
         DO 191 NM2LOCI = 5,5
! ******* NP1LOCI = NUMBER OF PLASTICITY ONE LOCI ******
         DO 183 NP1LOCI = 0,0
! ******* NPLOCI = NUMBER OF PLASTICITY ONE+TWO LOCI ******
         DO 182 NP12LOCI = 0,0
! ******* NPLOCI = NUMBER OF PLASTICITY TWO LOCI ******
         DO 181 NP2LOCI = 0,0
! ******* NMIGL = NUMBER OF MIGRATION LOCI ******    
         DO 17 NMIGL = 1,1
         MAXMIG = 1.0/(2.0*NMIGL)                !Limit sum to 1.0 for island migration
! ******* ND1LOCI = NUMBER OF DEVELOPMENTAL NOISE ONE LOCI ******
	 DO 171 ND1LOCI = 0,0
! ******* ND2LOCI = NUMBER OF DEVELOPMENTAL NOISE TWO LOCI ******
         DO 172 ND2LOCI = 0,0
! ******* TOTAL NUMBER OF LOCI ******  
         NM1ALL = 2*NM1LOCI
         NM12ALL = 2*NM12LOCI
         NM2ALL = 2*NM2LOCI
         NP1ALL = 2*NP1LOCI
         NP12ALL = 2*NP12LOCI
         NP2ALL = 2*NP2LOCI
	 ND1ALL = 2*ND1LOCI
         ND2ALL = 2*ND2LOCI
	 NM1LOC = NM1LOCI + NM12LOCI
	 NM1GENE = NM1ALL + NM12ALL
	 NM2GENE = NM12ALL + NM2ALL
	 NM12LOC = NM1LOCI + NM12LOCI + NM12LOCI + NM2LOCI
	 NMGENE = NM1ALL + NM12ALL + NM2ALL
	 NP1GENE = NP1ALL + NP12ALL
	 NP2GENE = NP12ALL + NP2ALL
	 NP12LOC = NP1LOCI + NP12LOCI + NP12LOCI + NP2LOCI
	 NPGENE = NP1ALL + NP12ALL + NP2ALL
	 NDGENE = ND1ALL + ND2ALL
	 ND12LOC = ND1LOCI + ND2LOCI
	 NPHALL = NMGENE + NPGENE + NDGENE
         NMGALL = 2*NMIGL
         NALL = NPHALL + NMGALL
! ******* PHENOTYPE MEASURES ********
	 NT1MEAN = NALL + 1
	 NT2MEAN = NALL + 2
         NT1PLAST = NALL + 3
         NT2PLAST = NALL + 4
	 NT1DEVEL = NALL + 5
	 NT2DEVEL = NALL + 6
         NMIGR = NALL + 7
         NT1PHENO = NALL + 8
         NT2PHENO = NALL + 9
         NLIVE = NALL + 10
! ******* DIMENSION ALLELIC AND GENOME ARRAYS ********
	 ALLOCATE (RALL(NDEME,NALL,5),YOUNG(MAXPOP,NALL),
       C           GENO(NDEME,MAXPOP,NLIVE))
!
! ******* SET GENOMIC PARAMETERS *******
! ******* VMLOCI = INITIAL GENETIC VARIATION OF MEAN LOCI (0 or 1) *****
         DO 23 VMLOCI = 1,1
! ******* MPLLOCI = INITIAL GENETIC VARIATION OF PLASTIC LOCI (0 or 1) ******
         DO 22 VPLLOCI = 1,1
! ******* LINKAGE = GENETIC LINKAGE (1 = none, 5 = complete) *******       
         DO 21 LIN = 1,1
	    LINKAGE = LNK(LIN)
! ******* MBIAS = ALLELIC BIAS TOWARDS OPTIMAL MEAN (1 = none) ******
         DO 20 MBI = 1,1
	    MBIAS = MBIS(MBI)
! ******* BIAS = ALLELIC BIAS TOWARDS OPTIMAL PLASTICITY (1 = none) ******
         DO 16 PLBI = 1,1
            PLBIAS = MBIS(PLBI)
!
! ******* SET ENVIRONMENTAL GRADIENT PARAMETERS *******
! ******* GRAD1 = SLOPE OF OPTIMAL PHENOTYPE FUNCTION FOR TRAIT 1 (1 = no slope) *****    
         DO 1501 GRD1 = 5,5
            GRAD1 = GRS(GRD1)
            IF (NDEME.GT.1) THEN
	       GRAD1 = GRAD1*50.0/NDEME       !Relativize gradient length to 50-deme equivalent 
            END IF
! ******* GRAD2 = SLOPE OF OPTIMAL PHENOTYPE FUNCTION FOR TRAIT 2 (5 = no slope) *****    
         DO 1502 GRD2 = 9,9                   
            GRAD2 = GRS2(GRD2)
            IF (NDEME.GT.1) THEN
	       GRAD2 = GRAD2*50.0/NDEME       !Relativize gradient length to 50-deme equivalent 
            END IF
         IF (ENVSAME.GT.0) GRAD2 = GRAD1 
! ****** IF ENVIRONMENT IS A STEP FUNCTION, SET NUMBER OF STEPS (1 = Continuous) ******
	  DO 151 NGSTEP = 1,1
! ****** SLOPE1 = SLOPE OF PLASTICITY FUNCTION FOR TRAIT 1 ********
          DO 1301 STP1 = 5,5
       	     SLOPE1 = STE(STP1)
! ****** SLOPE2 = SLOPE OF PLASTICITY FUNCTION FOR TRAIT 2 ********   
          DO 1302 STP2 = 5,5               
             SLOPE2 = STE(STP2)
	     IF (PHSAME.GT.0) SLOPE2 = SLOPE1
! ****** RELATIVIZE THE EFFECT OF TRAIT 1 PHENOTYPE ON TRAIT 2 *******
	     IF ((SLOPE2.EQ.0.0).OR.(GRAD2.EQ.0.0)) THEN
		RELBIO = 1.0
	     ELSE
		RELBIO = GRAD2/SLOPE2
	     END IF 
! ****** IF REACTION NORM IS A STEP FUNCTION, SET NUMBER OF STEPS (1 = Continuous) ******
	  DO 131 NPSTP = 1,1  
	     NPSTEP = NPSTP             
	     IF (STSAME.EQ.1) NPSTEP = NGSTEP
! ****** DIMENSION STEP FUNCTION VECTORS *******
         ALLOCATE (NGST(NGSTEP),NPST(NPSTEP))
!
! ****** SET SELECTION GRADIENT AND ALLELIC VALUES *******
         CALL INITIAL(GRAD1,GRAD2,OPT1,EOPT1,OPT2,EOPT2,STS,RALL,B1,
       C            BNEW1,B2,BNEW2,SLOPE1,SLOPE2,OPTMEAN1,OFFSET1,
       C            OPTMEAN2,OFFSET2,WIDTH,
       C            NGSTEP,NGST,NPSTEP,NPST,NDEME,NALL,NM1ALL,NM12ALL,
       C            NMGENE,NPHALL,NPGENE,MBIAS,PLBIAS,VMLOCI,VPLLOCI,
       C            EBASE,BBASE,BASETYPE)
!
! ****** SET ENVIRONMENTAL CHANGE PARAMETERS *******
! ****** SET TIMING OF ENVIRONMENTAL VARIATION RELATIVE TO DEVELOPMENT
             DO 1011 BEFORE1 = 1,1         !For trait 1 (1 = no, 2 = yes, 3 = linked, 4 = correlated)
             DO 1012 BEFORE2 = 1,1         !For trait 2 (1 = no, 2 = yes, 3 = linked, 4 = correlated, 5 = after 1)
	     DO 1013 TCONSTR = 3,3         !Timing of habitat construction (1 = before devel, 2 = after devel, 3 = after dispersal/selection, 4 = after selection/dispersal)
             DO 1021 AFTER1 = 1,1          !For trait 1 (1 = no, 2 = yes)  
             DO 1022 AFTER2 = 1,1          !For trait 2 (1 = no, 2 = yes)       
! ****** DECHAB = RATE OF HABITAT DECAY (1 = none, 11 = after 1 gener)
             DO 1023 NHAB = 1,11
	        DECHAB = HABDECAY(NHAB)
! ****** ENOISE = VARIANCE OF ENVIRONMENTAL NOISE (1 = none) *******
             DO 110 IENS1 = 1,1
                IF (NDEME.EQ.1) THEN
	           ENOISE1 = ENO1(IENS1)         !Set variance of environmental noise of trait 1
	        ELSE
	           ENOISE1 = ENO(IENS1)          !Set variance of environmental noise of trait 1
	        END IF
	     RNOISE1 = ENOISE1*GRAD1*NDEME       !Relativize to gradient - trait 1
	     BNOISE1 = ENOISE1*SLOPE1*NDEME      !Relativize to reaction norm slope - trait 1
             DO 111 IENS2 = 1,1            
                IF (NDEME.EQ.1) THEN
	           ENOISE2 = ENO1(IENS2)         !Set variance of environmental noise of trait 2
	        ELSE
	           ENOISE2 = ENO(IENS2)          !Set variance of environmental noise of trait 2
	        END IF
	     RNOISE2 = ENOISE2*GRAD2*NDEME       !Relativize to gradient - trait 2
	     BNOISE2 = ENOISE2*SLOPE2*NDEME      !Relativize to reaction norm slope - trait 2
             IF (ENVSAME.GT.0) THEN
		ENOISE2 = ENOISE1
                RNOISE2 = RNOISE1
                BNOISE2 = BNOISE1
	     END IF	         
! ****** CNOISE = AUTOCORRELATION OF ENVIRONMENTAL NOISE (4 = none) *******
             DO 113 ICNS1 = 4,4
	        CNOISE1 = CNO(ICNS1)              !Set autocorrelation of trait 1 environmental noise
             DO 112 ICNS2 = 4,4             
	        CNOISE2 = CNO(ICNS2)              !Set autocorrelation of trait 2 environmental noise
                IF (ENVSAME.GT.0) CNOISE2 = CNOISE1
! ****** SPCORR = SPATIAL AUTOCORRELATION OF ENVIRONMENTAL NOISE (1 = no, 2 = yes)
             DO 103 SPCORR1 = 1,1                 !Trait 1
             DO 104 SPCOR2 = 1,1                  !Trait 2
	        SPCORR2 = SPCOR2
	        IF (ENVSAME.GT.0) SPCORR2 = SPCORR1
!
! ****** SET DEVELOPMENT AND DISPERSAL PARAMETERS *******
! ****** HABCOST = COST OF HABITAT CONSTRUCTION (1 = none) *******
             DO 1130 IHCOST = 1,11
	        HABCOST = HCOST(IHCOST)
! ****** COST = COST OF PLASTICITY (1 = none) *******
             DO 1131 ICST1 = 1,1
	        COST1 = COSTER(ICST1)              !Set cost of plasticity of trait 1
	        IF (SLOPE1.EQ.0) THEN
                   RCOST1 = 0.0
		ELSE
	           RCOST1 = COST1*GRAD1/SLOPE1     !Relativize to gradient
	        END IF             
             DO 1132 ICST2 = 1,1             
	        COST2 = COSTER(ICST2)              !Set cost of plasticity of trait 2
	  	IF (PHSAME.GT.0) COST2 = COST1
	        IF (SLOPE2.EQ.0) THEN
	           RCOST2 = 0.0
	        ELSE
	           RCOST2 = COST2*GRAD2/SLOPE2     !Relativize to gradient
	        END IF
! ****** STABIL = PHENOTYPIC INSTABILITY CAUSED BY PLASTICITY (1 = none) ******
	     DO 1141 ISTAB1 = 1,1                   
	        STABIL1 = INSTAB(ISTAB1)           !Trait 1
      	     DO 1142 ISTAB2 = 1,1              
	        STABIL2 = INSTAB(ISTAB2)           !Trait 2
	        IF (PHSAME.GT.0) STABIL2 = STABIL1
! ****** RDEVEL = NONGENETIC-BASED DEVELOPMENTAL NOISE (1 = none) ******
             DO 1143 IRDEV1 = 1,1
	        RDEVEL1 = INDEV(IRDEV1)           
	        RANDEV1 = RDEVEL1*GRAD1*NDEME      !Relativize to gradient - trait 1
             DO 1144 IRDEV2 = 1,1
	        RDEVEL2 = INDEV(IRDEV2)
	        RANDEV2 = RDEVEL2*GRAD2*NDEME      !Relativize to gradient - trait 2
		IF (PHSAME.GT.0) RANDEV2 = RANDEV1
! ****** FUZ = AMOUNT OF ERROR IN ENVIRONMENTAL ASSESSMENT (1 = none) ******
             DO 115 IFZ = 1,1
	        FUZ = FUZZ(IFZ)
! ****** FBIAS = BIAS IN ENVIRONMENTAL ASSESSMENT (6 = none) ******
             DO 116 FZB = 6,6
	        FBIAS = FUZBIAS(FZB)
! ****** CM = PROBABILITY OF DYING DURING MOVEMENT  (1 = none) ******
             DO 117 ICM = 2,2
	        CM = CMOVE(ICM)
! ****** MR = INITIAL MIGRATION RATE ********
                DO 11 MRL = 6,6
		   IF (MIGTYPE.EQ.'STEP') THEN         
		      MR = MIGRS(MRL)*(5.0/NMIGL)    !Stepping-stone migration
                   ELSE
                     MR = MIGRI(MRL)/(2.0*NMIGL)     !Island migration
                   END IF
!
! **************** BEGIN BODY OF PROGRAM *********************
                   NCRASH = 0
                   MREP = 0
	           MMFIT = 0
                   DO 3 J = 1,NPARAM
	              RMSUM(J) = 0
3	              RMSUMSQ(J) = 0
! ********** BEGIN REPLICATES FOR ONE PARAMETER COMBINATION ********
81                    MREP = MREP + 1
                      CALL POPS(NPOP,RALL,B1,B2,GENO,MCOUNT,NDEME,      !Initialize metapopulation
     C                          MR,MAXPOP,NT1MEAN,NT2MEAN,NT1PLAST,
     C                          NT2PLAST,NT1DEVEL,NT2DEVEL,NMIGR,
     C                  NT1PHENO,NT2PHENO,NLIVE,NALL,NM1ALL,NM12ALL,
     C                          NM2ALL,NP1ALL,NP12ALL,NP2ALL,NMGENE,
     C                          NPGENE,ND1ALL,NPHALL,SEED,STABIL1,
     C                          STABIL2,TCONFIG,ECONFIG,PLCONFIG,
     C                          RELBIO,RANDEV1,RANDEV2)
	               DO 1 I=1,NDEME
1                         ELAST(I) = 0                                   !Set noise vector to zero
                       DO 2 NGEN = 1,TGEN
! ******** REPRODUCTION AND MUTATION HAPPENS *********
                         IF (NSH.EQ.1) CALL REPSOFT(NPOP,MCOUNT,GENO,     !Soft selection reproduction
     C                            YOUNG,NDEME,MAXPOP,NALL,NLIVE,LINKAGE) 
                         IF (NSH.EQ.2) THEN                               !Hard selection reproduction
	                      CALL MORTAL(MCOUNT,GENO,NDEME,MAXPOP,NLIVE, !Reduce deme to carrying capacity
     C                                    NPOP,NQ1,NQ2)
			      CALL REPHARD(MCOUNT,GENO,YOUNG,NDEME,MAXPOP,!Fixed fecundity reproduction
     C                                     NALL,NLIVE,LINKAGE)                               
	                 END IF 
                         CALL MUTATE(MCOUNT,GENO,NDEME,MAXPOP,NALL,       !Mutate alleles
     C                               NMGENE,NPGENE,NDGENE,NPHALL,
     C                               NLIVE,MUTRATE,MGMUT,MUTVAR,
     C                               MIGVAR,MAXMIG,MIGTYPE)              
! ******** HABITAT CONSTRUCTION AFTER REPRODUCTION HAPPENS **********
                         IF (CONSTR.EQ.1) THEN
	                    CALL DECAY(EBASE,EOPT1,BBASE,BNEW2,           !Relax habitat back towards baseline
     C                                 NDEME,DECHAB)
                            IF (TCONSTR.EQ.1) THEN
	                       CALL HABITAT(EOPT1,BNEW2,NDEME,GENO,       !Alter habitat towards constructed optimum
     C                                      NLIVE,MAXPOP,NT1PHENO,
     C                                 MCOUNT,MAXDHAB,MAXBUILD,RELBIO)
	                    END IF
	                  END IF
! ******** ENVIRONMENTAL CHANGE BEFORE DEVELOPMENT HAPPENS ********
			  IF (BEFORE1.EQ.2) THEN
			     CALL SETENV1(B1,BNEW1,NDEME,CNOISE1,        !Set plasticity effect only - trait 1
     C 			                  BNOISE1,SPCORR1)
                             IF (ENVSAME.EQ.2) THEN                      !Make change same for both traits
	                        CALL EQENV(BNEW1,BNEW2,NDEME)
	                        GOTO 812
	                     END IF
	                   END IF
			   IF (BEFORE2.EQ.2) THEN
			      CALL SETENV1(B2,BNEW2,NDEME,CNOISE2,        !Set plasticity effect only - trait 2
     C 			                   BNOISE2,SPCORR2)
                           END IF
812			   IF (BEFORE1.GT.2) THEN
                             IF (CONSTR.EQ.0) THEN
				CALL SETENV3(OPT1,EOPT1,B1,BNEW1,NDEME,  !Set both selection optimum and plasticity effect - trait 1
     C 				             RNOISE1,CNOISE1,BNOISE1,SPCORR1)
                                IF (ENVSAME.EQ.2) THEN                   !Make change same for both traits
  	                           CALL EQENV(BNEW1,BNEW2,NDEME)
		                   CALL EQENV(EOPT1,EOPT2,NDEME)
                                  IF (BEFORE2.EQ.5) THEN                 !Let environment change again before trait 2 development
			             CALL SETENV3(OPT2,EOPT2,B2,BNEW2,   !Set both selection optimum and plasticity effect - trait 2
     C 					NDEME,RNOISE2,CNOISE2,BNOISE2,SPCORR2)
	                          END IF
			          GOTO 813
		                END IF
	                      ELSE	  
				 CALL SETENV3H(EOPT1,ELAST,BNEW2,BLAST,   !Set both selection optimum and plasticity effect with construction
     C                           NDEME,RNOISE1,CNOISE1,BNOISE1,SPCORR1)                                    
	                         GOTO 813
	                      END IF
	                   END IF
			   IF (BEFORE2.GT.2) THEN
		              CALL SETENV3(OPT2,EOPT2,B2,BNEW2,NDEME,      !Set both selection optimum and plasticity effect - trait 2
     C 				       RNOISE2,CNOISE2,BNOISE2,SPCORR2)
	                   END IF
! ******** DEVELOPMENT HAPPENS *********
813		           CALL DEVELOP(MCOUNT,BNEW1,BNEW2,GENO,NDEME,     !Determine the phenotype
     C         MAXPOP,NALL,NM1ALL,NM12ALL,NP1ALL,NP12ALL,ND1ALL,NMGENE,
     C                    NPGENE,NPHALL,NMIGR,NT1MEAN,NT2MEAN,NT1PLAST,
     C                    NT2PLAST,NT1DEVEL,NT2DEVEL,NT1PHENO,NT2PHENO,
     C                  NLIVE,STABIL1,STABIL2,TCONFIG,ECONFIG,PLCONFIG,
     C                    RELBIO,RANDEV1,RANDEV2)
                           IF (BEFORE2.EQ.5) THEN                           !Set environments to be same
	                      CALL EQENV(BNEW2,BNEW1,NDEME)
		              CALL EQENV(EOPT2,EOPT1,NDEME)
	                   END IF
                           IF (FCONFIG.EQ.2) THEN
	                      CALL FITS2(MCOUNT,GENO,STS,EOPT1,EOPT2,       !Calculate metapop mean fitness for two-trait selection
     C                                 MEANFIT,NDEME,MAXPOP,NT1PLAST,
     C                                 NT1PHENO,NT2PLAST,NT2PHENO,NLIVE,
     C                             RCOST1,RCOST2,CONSTR,HABCOST,MAXDHAB)       
	                    ELSE
                              IF (ENVMEAN.EQ.0) THEN
	                         CALL FITS1(MCOUNT,GENO,STS,EOPT2,MEANFIT,  !Calculate metapop mean fitness for single trait selection
     C                                   NDEME,MAXPOP,NT1PLAST,NT1PHENO,
     C                                    NT2PLAST,NT2PHENO,NLIVE,
     C                             RCOST1,RCOST2,CONSTR,HABCOST,MAXDHAB)
	                      ELSE
		                 CALL MEANENV(EOPT1,EOPT2,EOPTM,NDEME)      !Average the two environments
	                         CALL FITS1(MCOUNT,GENO,STS,EOPTM,MEANFIT,  !Calculate metapop mean fitness for single trait selection
     C                                   NDEME,MAXPOP,NT1PLAST,NT1PHENO,
     C                                    NT2PLAST,NT2PHENO,NLIVE,
     C                             RCOST1,RCOST2,CONSTR,HABCOST,MAXDHAB)
                              END IF
                           END IF
	                   IF (MEANFIT.EQ.0.0) THEN                         !Check number of crashes
	                      MREP = MREP - 1
			      NCRASH = NCRASH + 1
			      IF (MREP.EQ.0) THEN
				 IF (NCRASH.EQ.MAXCRASH) GOTO 82        
			      END IF 
                              IF (NCRASH.EQ.MULCRASH) GOTO 82
		              GOTO 81
			   END IF
! ******** HABITAT CONSTRUCTION AFTER DEVELOPMENT HAPPENS **********
                           IF ((CONSTR.EQ.1).AND.(TCONSTR.EQ.2)) THEN
	                      CALL HABITAT(EOPT1,BNEW2,NDEME,GENO,NLIVE,    !Alter habitat towards constructed optimum
     C                                   MAXPOP,NT1PHENO,MCOUNT,
     C                                   MAXDHAB,MAXBUILD,RELBIO)
	                   END IF
! ******** MIGRATION BEFORE SELECTION HAPPENS ********
                           IF (NDEME.EQ.1) GOTO 2222
                           IF (MS.EQ.2) GOTO 2222                           !Move before selection
			      IF (CHOICE.EQ.'Y') THEN                       !Determine if there is habitat choice
  				 IF (MIGTYPE.EQ.'STEP') THEN
				    CALL MSCHOICE(MCOUNT,NCOUNT,GENO,       !Stepping-stone migration with choice
     C                           NDEME,MAXPOP,NMIGR,NLIVE,FUZ,FBIAS,
     C     	                   RCOST1,RCOST2,NT1PLAST,NT2PLAST,
     C                           NT1PHENO,NT2PHENO,EOPT1,EOPT2,STS,
     C                           CM,FCONFIG)
	                         ELSE
                                   CALL MICHOICE(MCOUNT,NCOUNT,GENO,        !Island migration with choice
     C                           NDEME,MAXPOP,NMIGR,NLIVE,FUZ,FBIAS,
     C     	                   RCOST1,RCOST2,NT1PLAST,NT2PLAST,
     C                           NT1PHENO,NT2PHENO,EOPT1,EOPT2,STS,
     C                           CM,FCONFIG)
	                         END IF
			       ELSE											  !No habitat choice
				 IF (MIGTYPE.EQ.'STEP') THEN
				    CALL MIGSTEP(MCOUNT,NCOUNT,GENO,         !Stepping-stone migration without choice
     C            		         NDEME,MAXPOP,NMIGR,NLIVE,CM)
	                         ELSE
                                    CALL MIGISLE(MCOUNT,NCOUNT,GENO,         !Island migration without choice
     C            			  NDEME,MAXPOP,NMIGR,NLIVE,CM)
	                         END IF
			       END IF
! ******** HABITAT CONSTRUCTION AFTER MIGRATION/SELECTION HAPPENS **********
2222                          IF ((CONSTR.EQ.1).AND.(TCONSTR.EQ.3)) THEN
	                        CALL HABITAT(EOPT1,BNEW2,NDEME,GENO,NLIVE,   !Alter habitat towards constructed optimum
     C                                   MAXPOP,NT1PHENO,MCOUNT,
     C                                   MAXDHAB,MAXBUILD,RELBIO)
	                        CALL EQENV(BNEW1,BNEW2,NDEME)
	                      END IF
! ******** ENVIRONMENTAL CHANGE AFTER DEVELOPMENT AND BEFORE SELECTION HAPPENS ********
			      IF (AFTER1.EQ.2) THEN
                                IF (CONSTR.EQ.0) THEN
				   CALL SETENV2(OPT1,EOPT1,NDEME,RNOISE1,    !Set selection optimum only - trait 1
     C                                          CNOISE1,SPCORR1)
                                   IF (ENVSAME.EQ.2) THEN
	                              CALL EQENV(EOPT1,EOPT2,NDEME)
	                              GOTO 815
	                           END IF
                                ELSE
				  CALL SETENV2H(EOPT1,ELAST,NDEME,RNOISE1,   !Set both selection optimum and plasticity effect with construction
     C                                          CNOISE1,SPCORR1)           
	                          GOTO 815
	                        END IF
	                     END IF
			     IF (AFTER2.EQ.2) THEN
				CALL SETENV2(OPT2,EOPT2,NDEME,RNOISE2,      !Set selection optimum only - trait 2
     C                                       CNOISE2,SPCORR2)
	                         GOTO 815
                             END IF
814			     IF (BEFORE1.EQ.4) THEN
                                IF (CONSTR.EQ.0) THEN
				   CALL SETENV3(OPT1,EOPT1,B1,BNEW1,NDEME,  !Set both selection optimum and plasticity effect - trait 1
     C 				            RNOISE1,CNOISE1,BNOISE1,SPCORR1)
                                   IF (ENVSAME.EQ.2) THEN                   !Make change same for both traits
  	                              CALL EQENV(BNEW1,BNEW2,NDEME)
		                      CALL EQENV(EOPT1,EOPT2,NDEME)
                                      IF (BEFORE2.EQ.5) THEN                !Let environment change again before trait 2 development
					 CALL SETENV3(OPT2,EOPT2,B2,BNEW2,  !Set both selection optimum and plasticity effect - trait 2
     C 					              NDEME,RNOISE2,CNOISE2,
     C                                                BNOISE2,SPCORR2)
	                              END IF
				      GOTO 815
		                    END IF
	                         ELSE	  
				    CALL SETENV3H(EOPT1,ELAST,BNEW2,BLAST,   !Set both selection optimum and plasticity effect with construction
     C                                NDEME,RNOISE1,CNOISE1,BNOISE1,SPCORR1)                                    
	                            GOTO 815
	                         END IF
	                      END IF
			      IF (BEFORE2.EQ.4) THEN
			         CALL SETENV3(OPT2,EOPT2,B2,BNEW2,NDEME,     !Set both selection optimum and plasticity effect - trait 2
     C 			                   RNOISE2,CNOISE2,BNOISE2,SPCORR2)
 	                      END IF
! ******** SELECTION HAPPENS *************
815                           IF (FCONFIG.EQ.2) THEN
			         CALL SELECT2(MCOUNT,GENO,STS,NDEME,MAXPOP,  !Two-trait selection
     C                                   NALL,NT1PLAST,NT1PHENO,
     C                                   NT2PLAST,NT2PHENO,NLIVE,
     C                                   RCOST1,RCOST2,EOPT1,EOPT2,
     C                                   CONSTR,HABCOST,MAXDHAB)
                               ELSE 
                                 IF (ENVMEAN.EQ.0) THEN
	                            CALL SELECT1(MCOUNT,GENO,STS,NDEME,      !Single-trait election
     C                               MAXPOP,NALL,NT1PLAST,NT2PLAST,
     C                         NT1PHENO,NT2PHENO,NLIVE,RCOST1,RCOST2,
     C                               EOPT2,CONSTR,HABCOST,MAXDHAB)
	                          ELSE
		                     CALL MEANENV(EOPT1,EOPT2,EOPTM,NDEME)   !Average the two environments
	                             CALL SELECT1(MCOUNT,GENO,STS,NDEME,     !Single-trait election
     C                                    MAXPOP,NALL,NT1PLAST,NT2PLAST,
     C                              NT1PHENO,NT2PHENO,NLIVE,RCOST1,RCOST2,
     C                                       EOPTM,CONSTR,HABCOST,MAXDHAB)
	                          END IF
	                       END IF
! ******** MIGRATION AFTER SELECTION HAPPENS ********
                               IF (NDEME.EQ.1) GOTO 1111
                               IF (MS.EQ.1) GOTO 1111                         !Move after selection
			       IF (CHOICE.EQ.'Y') THEN                        !Determine if there is habitat choice
			          IF (MIGTYPE.EQ.'STEP') THEN
				     CALL MSCHOICE(MCOUNT,NCOUNT,GENO,        !Stepping-stone migration with choice
     C                                NDEME,MAXPOP,NMIGR,NLIVE,FUZ,FBIAS,
     C     	                      RCOST1,RCOST2,NT1PLAST,NT2PLAST,
     C                                NT1PHENO,NT2PHENO,EOPT1,EOPT2,STS,
     C                                CM,FCONFIG)
	                           ELSE
                                     CALL MICHOICE(MCOUNT,NCOUNT,GENO,        !Island migration with choice
     C                                NDEME,MAXPOP,NMIGR,NLIVE,FUZ,FBIAS,
     C     	                      RCOST1,RCOST2,NT1PLAST,NT2PLAST,
     C                                NT1PHENO,NT2PHENO,EOPT1,EOPT2,STS,
     C                                CM,FCONFIG)
	                           END IF
			        ELSE											  !No habitat choice
 				   IF (MIGTYPE.EQ.'STEP') THEN
				      CALL MIGSTEP(MCOUNT,NCOUNT,GENO,         !Stepping-stone migration without choice
     C            		            NDEME,MAXPOP,NMIGR,NLIVE,CM)
	                           ELSE
                                      CALL MIGISLE(MCOUNT,NCOUNT,GENO,         !Island migration without choice
     C            			       NDEME,MAXPOP,NMIGR,NLIVE,CM)
	                           END IF
	                        END IF
! ******** HABITAT CONSTRUCTION AFTER SELECTION/MIGRATION HAPPENS **********
1111                            IF ((CONSTR.EQ.1).AND.(TCONSTR.EQ.4)) THEN
	                           CALL HABITAT(EOPT1,BNEW2,NDEME,GENO,NLIVE,  !Alter habitat towards constructed optimum
     C                                          MAXPOP,NT1PHENO,MCOUNT,
     C                                          MAXDHAB,MAXBUILD,RELBIO)
	                           CALL EQENV(BNEW1,BNEW2,NDEME)
	                        END IF
! ******** WRAP UP ONE REPLICATION ***********
			        CALL WHEREAT(MS,MR,NGEN,MEANFIT,MREP,          !Report on status of simulation
     C                             NM12LOC,NP12LOC,ND12LOC,NMIGL,GRAD1,
     C                             SLOPE1,CNOISE1,ENOISE1,HABCOST,DECHAB,
     C                             STABIL1,RDEVEL1,PLBIAS,FBIAS,FUZ,CM)
                                IF (NOTRANS.EQ.0) GOTO 2                       !Skip if you do not want transient values
				   IF (MREP.EQ.1) THEN                         !Output transient of 1st replicate
			              CALL TRANSIENT(NSH,MS,GRAD1,GRAD2,SLOPE1, 
     C                    SLOPE2,MBIAS,PLBIAS,MR,NGEN,NM1LOCI,NM12LOCI,NM2LOCI,
     C                    NP1LOCI,NP12LOCI,NP2LOCI,ND1LOCI,ND2LOCI,NMIGL,
     C                    LINKAGE,VMLOCI,VPLLOCI,MCOUNT,GENO,NDEME,MAXPOP,
     C                    NT1MEAN,NT2MEAN,NT1PLAST,NT2PLAST,NT1DEVEL,NT2DEVEL,
     C                    NMIGR,NT1PHENO,NT2PHENO,NLIVE,MEANFIT,ENOISE1,
     C                    ENOISE2,COST1,COST2,HABCOST,CNOISE1,CNOISE2,STABIL1,
     C                    STABIL2,RDEVEL1,RDEVEL2,BEFORE1,BEFORE2,AFTER1,
     C                    AFTER2,TCONSTR,SPCORR1,SPCORR2,FBIAS,FUZ,CM,NGSTEP,
     C                    NPSTEP,DECHAB,EOPT1)
				   END IF
2                    CONTINUE
! ******** MEASURE PARAMETERS FOR THAT REPLICATE ********
! ******** ONE MORE ROUND OF REPRODUCTION ********
4                    IF (NSH.EQ.1) CALL REPSOFT(NPOP,MCOUNT,GENO,               !Soft selection reproduction
     C                        YOUNG,NDEME,MAXPOP,NALL,NLIVE,LINKAGE) 
                     IF (NSH.EQ.2) THEN                                         !Hard selection reproduction
                        CALL MORTAL(MCOUNT,GENO,NDEME,MAXPOP,NLIVE,             !Reduce deme to carrying capacity
     C                              NPOP,NQ1,NQ2)
		        CALL REPHARD(MCOUNT,GENO,YOUNG,NDEME,MAXPOP,            !Fixed fecundity reproduction
     C                                   NALL,NLIVE,LINKAGE)                               
	             END IF 
                     IF (ENVMEAN.EQ.0) THEN
                        CALL MEASURE(MCOUNT,GENO,POPMEAN,NDEME,                 !Measure deme mean values
     C                 MAXPOP,NALL,NM1ALL,NM1GENE,NM2GENE,NMGENE,NP1ALL,
     C                 NP1GENE,NP2GENE,NPGENE,ND1ALL,ND2ALL,NPHALL,
     C                 NMGALL,NT1MEAN,NT2MEAN,NT1PLAST,NT2PLAST,
     C                 NT1DEVEL,NT2DEVEL,NMIGR,NT1PHENO,NT2PHENO,NLIVE,
     C                 STS,EOPT1,EOPT2,NPARAM,RCOST1,RCOST2,METAMEAN,
     C                 FCONFIG,CONSTR,HABCOST,MAXDHAB)
	             ELSE
		       CALL MEANENV(EOPT1,EOPT2,EOPTM,NDEME)                    !Average the two environments
                       CALL MEASURE(MCOUNT,GENO,POPMEAN,NDEME,                  !Measure deme mean values
     C                  MAXPOP,NALL,NM1ALL,NM1GENE,NM2GENE,NMGENE,NP1ALL,
     C                  NP1GENE,NP2GENE,NPGENE,ND1ALL,ND2ALL,NPHALL,
     C                  NMGALL,NT1MEAN,NT2MEAN,NT1PLAST,NT2PLAST,
     C                  NT1DEVEL,NT2DEVEL,NMIGR,NT1PHENO,NT2PHENO,NLIVE,
     C                  STS,EOPT1,EOPTM,NPARAM,RCOST1,RCOST2,METAMEAN,
     C                  FCONFIG,CONSTR,HABCOST,MAXDHAB)
	             END IF
! ********* CALCULATE SUMS AND SUMS-OF-SQUARES OF MEAN DEME AND METAPOPULATION PARAMETERS ********
                     DO 6 J = 1,NPARAM
                        RMSUM(J) = RMSUM(J) + METAMEAN(J) 
	                RMSUMSQ(J) = RMSUMSQ(J) +
     C			             (METAMEAN(J)*METAMEAN(J))
6                     CONTINUE
8                  IF (MREP.LT.NREP) GOTO 81
! ****** CALCULATE METAPOPULATON AND DEME MEAN AND SE VALUES FOR THIS PARAMETER COMBINATION ******
82                 DO 9 J = 1,NPARAM
                      JJ = (J*2)-1
	              OUTSMP(JJ) = RMSUM(J)/(NREP*1.0)
	              OUTSMP((J*2)) = SE(RMSUM(J),RMSUMSQ(J),NREP)
9                  CONTINUE
! ********* OUTPUT METAPOPULATON AND DEME MEAN RESULTS FOR THIS PARAMETER COMBINATION *********
                   CALL MPOUTER(NSH,MS,GRAD1,GRAD2,SLOPE1,SLOPE2,MR,
     C                OUTSMP,MEANFIT,NCRASH,NPARAM,BIASM,PLBIAS,NM1LOCI,
     C                NM12LOCI,NM2LOCI,NP1LOCI,NP12LOCI,NP2LOCI,ND1LOCI,
     C                ND2LOCI,NMIGL,LINKAGE,VMLOCI,VPLLOCI,ENOISE1,
     C                ENOISE2,COST1,COST2,HABCOST,CNOISE1,CNOISE2,
     C                BEFORE1,BEFORE2,AFTER1,AFTER2,TCONSTR,SPCORR1,
     C                SPCORR2,STABIL1,STABIL2,RDEVEL1,RDEVEL2,FBIAS,FUZ,
     C                CM,NGSTEP,NPSTEP,DECHAB)
! *********** LOOP TO NEW PARAMETER COMBINATION **********
11              CONTINUE
117             CONTINUE
116             CONTINUE
115             CONTINUE
1144		CONTINUE
1143		CONTINUE
1142		CONTINUE
1141		CONTINUE
1132         CONTINUE
1131         CONTINUE
1130         CONTINUE
104          CONTINUE
103          CONTINUE
112          CONTINUE
113          CONTINUE
111          CONTINUE
110          CONTINUE
1023         CONTINUE
1022         CONTINUE
1021         CONTINUE
1013         CONTINUE
1012         CONTINUE
1011         CONTINUE
          DEALLOCATE (NGST,NPST)
131       CONTINUE
1302      CONTINUE
1301      CONTINUE
151    CONTINUE
1502   CONTINUE
1501   CONTINUE
16     CONTINUE
20     CONTINUE
21     CONTINUE
22     CONTINUE
23     CONTINUE
       DEALLOCATE (RALL,YOUNG,GENO)
172    CONTINUE
171    CONTINUE
17     CONTINUE
181    CONTINUE
182    CONTINUE
183    CONTINUE
191    CONTINUE
192    CONTINUE
193    CONTINUE
24     CONTINUE
25     CONTINUE
       STOP
       END
!
!
!
! ******* THIS SUBROUTINE SETS THE PARAMETER VALUES FOR THE SIMULATION *******	
       SUBROUTINE SIMPARAM(NDEME,CHOICE,MIGTYPE,NPOP,MAXPOP,NREP,
     C                     MAXCRASH,MULCRASH,TGEN,OPTMEAN1,OFFSET1,
     C                     OPTMEAN2,OFFSET2,WIDTH,
     C                     MUTRATE,MGMUT,MUTVAR,MIGVAR,SEED,NPARAM,
     C                     FCONFIG,TCONFIG,ECONFIG,PLCONFIG,ENVSAME,
     C                     ENVMEAN,STSAME,PHSAME,CONSTR,BASETYPE,
     C                     MAXDHAB,MAXBUILD)
       REAL MUTRATE,MUTVAR,MGMUT,MIGVAR,TCONFIG,ECONFIG,PLCONFIG
       REAL MAXDHAB,MAXBUILD
       INTEGER SEED,TGEN,FCONFIG,ENVSAME,STSAME,PHSAME,ENVMEAN
       CHARACTER GTYPE*4,PLTYPE*4,MIGTYPE*4,CHOICE*1
! ****** CHANGE "SEED" TO OBTAIN DIFFERENT RANDOM NUMBER *******
! ******    SEQUENCE. IT MUST BE A LARGE, ODD NUMBER.    *******
       SEED = 12231957
!
! ************ SET PARAMETERS FOR DESIRED MODELS ***********
!
! ****** CHOICE = PRESENCE OR ABSENCE OF HABITAT CHOICE (Y(ES) OR N(O)) ******* 
       CHOICE = 'N'
! ****** CONSTR = PRESENCE OR ABSENCE OF HABITAT CONSTRUCTION (1(YES) OR 0(NO)) ******* 
       CONSTR = 1
! ****** BASETYPE = SLOPE OF HABITAT BASELINE (0(NO SLOPE) OR 1(MATCHES TRAIT 1)) ********
       BASETYPE = 1
! ****** MAXDHAB = MAXIMUM PER INDIVIDUAL CHANGE IN ENVIRONMENT DUE TO HABITAT CONSTRUCTION *******
       MAXDHAB = 1
! ****** MAXBUILD = MAXIMUM PER DEME (INDIVIDUAL MULTIPLIER) HABITAT CONSTRUCTION *******
       MAXBUILD = 5
! ****** FCONFIG = RELATIONSHIP OF TRAITS TO FITNESS (1(single-trait) OR 2(two-trait))
       FCONFIG = 1
! ****** TCONFIG = EFFECT OF TRAIT 1 ON PHENOTYPE OF TRAIT 2 (1(YES) OR 0(NO)) *******
       TCONFIG = 0
! ****** ECONFIG = EFFECT OF ENVIRONMENT ON PHENOTYPE OF TRAIT 2 (1(YES) OR 0(NO)) *******
       ECONFIG = 1
! ****** PLCONFIG = IF TRAIT 2 IS ALSO DETERMINED BY THE PLASTICITY 1 LOCI (1(YES) OR 0(NO)) *******
       PLCONFIG = 0
! ****** ENVSAME = IF THE ENVIRONMENTS AFFECTING THE TWO TRAITS ARE RELATED (0(NO) OR 1(SIMILAR) OR 2(IDENTICAL)) *******
       ENVSAME = 2
! ****** ENVMEAN = IF THE ENVIRONMENT OF SELECTION IS THE AVERAGE OF THE TWO ENVIRONMENTS (1(YES) OR 0(NO)) *******
       ENVMEAN = 1
! ****** MIGTYPE = TYPE OF MIGRATION PATTERN (STEP(stepping-stone) OR ISLE(island)) ********
       MIGTYPE = 'STEP'
! ****** STSAME = IF THE DEME AND REACTION NORM STEPS ARE THE SAME (1(YES) OR 0(NO)) *******
       STSAME = 1
! ****** PHSAME = IF THE DEVELOPMENTAL PATTERNS ARE THE SAME (1(YES) OR 0(NO)) *******
       PHSAME = 0
! ****** SET NUMBER OF DEMES ******
       NDEME = 50
! ****** NPOP = POPULATION SIZE/CARRYING CAPACITY ****
       NPOP = 100
! ****** MAXPOP = MAXIMUM POPULATION SIZE *****
       MAXPOP = 10*NPOP
! ******** NREP = NUMBER OF REPLICATES PER PARAMTER SET ******
       NREP = 20
! ******** MAXCRASH = MAXIMUM NUMBER OF POPULATION CRASHES FOR FIRST REPLICATE ******
	 MAXCRASH = 3*NREP 
! ******** MULCRASH = MAXIMUM NUMBER OF POPULATION CRASHES FOR ALL REPLICATES ******
       MULCRASH = 5*MAXCRASH
! ******** TGEN = TOTAL NUMBER OF GENERATIONS PER REPLICATE ******
       TGEN = 1000
! ****** OPTMEAN1 = OFFSET OF GRADIENT 1 ALONG Y AXIS *******
       OPTMEAN1 = 0
! ****** OPTMEAN2 = OFFSET OF GRADIENT 2 ALONG Y AXIS *******
       OPTMEAN2 = 10
! ******* OFFSET1 = OFFSET OF GRADIENT 1 ALONG X AXIS *******
       OFFSET = 0
! ******* OFFSET2 = OFFSET OF GRADIENT 2 ALONG X AXIS *******
       OFFSET2 = 0
! ******* WIDTH = WIDTH OF THE SELECTION FUNCTION *******
       WIDTH = 2
! ******* MUTRATE = PHENOTYPE MUTATION RATE *******
       MUTRATE = 0.1
! ******* MGMUT = MIGRATION MUTATION RATE *******
	 MGMUT = 0
! ******* MUTVAR = STANDARD DEVIATION OF PHENOTYPE MUTATION FUNCTION *****
       MUTVAR = 0.1 
! ******* MIGVAR = STANDARD DEVIATION OF MIGRATION MUTATION FUNCTION *****
       MIGVAR = 0.1
! ******* NPARAM = NUMBER OF PARAMETERS PRODUCED BY SIMULATION *****
       NPARAM = 39
       RETURN
       END
!
!
!
! ****THIS SUBROUTINE INPUTS SELECTION GRADIENT AND ALLELIC VALUES ****
       SUBROUTINE INITIAL(GRAD1,GRAD2,OPT1,EOPT1,OPT2,EOPT2,STS,RALL,B1,
     C                    BNEW1,B2,BNEW2,SLOPE1,SLOPE2,OPTMEAN1,
     C                    OFFSET1,OPTMEAN2,OFFSET2,
     C                    WIDTH,NGSTEP,NGST,NPSTEP,NPST,NDEME,NALL,
     C                    NM1ALL,NM12ALL,NMGENE,NPHALL,NPGENE,MBIAS,
     C                    PLBIAS,VMLOCI,VPLLOCI,EBASE,BBASE,BASETYPE)
       REAL OPT1(NDEME),OPT2(NDEME),STS(NDEME),RALL(NDEME,NALL,5)
       REAL SETALL(5),B1(NDEME),B2(NDEME),MOPT1,MB1,MOPT2,MB2
       REAL MBIAS,EOPT1(NDEME),EOPT2(NDEME),BNEW1(NDEME),BNEW2(NDEME)
       REAL EBASE(NDEME),BBASE(NDEME)
       INTEGER*4 I,J
       INTEGER VMLOCI,VPLLOCI,NGST(NGSTEP),NPST(NPSTEP)
       CHARACTER*4 GTYPE,PLTYPE
       DATA SETALL /-2,-1,0,1,2/
       CENT = (-1.0*((NDEME+1.0)/2.0))
! ******** SET SELECTION FUNCTIONS FOR TRAITS 1 AND 2 *******
       XI = 1.0                     
       DO 8 I = 1,NDEME
         OPT1(I)= OPTMEAN1 + (GRAD1 * (CENT + OFFSET1 + XI))
         EOPT1(I) = OPT1(I)
         OPT2(I)= OPTMEAN2 + (GRAD2 * (CENT + OFFSET2 + XI))
         EOPT2(I) = OPT2(I)
8        XI = XI + 1.0
! ******** IF ENVIRONMENT CONSISTS OF STEPS *********
       IF (NGSTEP.GT.1) THEN       
         NDS = INT(1.0*NDEME/NGSTEP)    !Base number of demes per step
         DO 20 I = 1,NGSTEP
20          NGST(I) = NDS
         NR = NDEME - (NDS*NGSTEP)      !Remainder number to be distributed
         IF (NR.EQ.0) GOTO 40
         NRR = INT(INT(NR/2.0)+0.5)
         DO 21 I = 1,NRR                !Distribute from bottom up
21          NGST(I) = NGST(I) + 1
         NRRR = NR - NRR - 1
         DO 22 I = NGSTEP,(NGSTEP-NRRR),-1   !Distribute from top down
22          NGST(I) = NGST(I) + 1
! ******** REPLACE OPTIMAL VALUES WITH MEAN FOR EACH STEP ********
40       NST1 = 1
	   NST2 = 0
	   DO 23 I = 1,NGSTEP
	      NST2 = NST2 + NGST(I)
	      SOPT1 = 0
	      SOPT2 = 0
	      DO 24 J = NST1,NST2
                 SOPT1 = SOPT1 + OPT1(J) 
24	         SOPT2 = SOPT2 + OPT2(J) 
	      MOPT1 = SOPT1/(1.0*NGST(I))
	      MOPT2 = SOPT2/(1.0*NGST(I))
	      DO 25 J = NST1,NST2
	         OPT1(J) = MOPT1
	         EOPT1(J) = OPT1(J)
	         OPT2(J) = MOPT2
25	         EOPT2(J) = OPT2(J)
              NST1 = NST1 + NGST(I)
23        CONTINUE
       END IF
! ****** SET WIDTH OF SELECTION FUNCTION IN EACH ENVIRONMENT ******
       DO 9 I = 1,NDEME
9         STS(I) = WIDTH
! ****** SET INITIAL ALLELIC VALUES ******
       DO 14 I = 1,NDEME
 	  DO 101 K = 1,NM1ALL                                      !Trait 1 nonplastic loci
          DO 101 J=1,5
101          RALL(I,K,J) = VMLOCI*(SETALL(J)) + (MBIAS*OPT1(I))
 	  DO 1012 K = (NM1ALL+1),(NM1ALL+NM12ALL)                  !Trait 1 + 2 nonplastic loci
          DO 1012 J=1,5
             RALL(I,K,J) = VMLOCI*(SETALL(J)) + 
     C                    (MBIAS*(OPT1(I)+OPT2(I))/2)
1012      CONTINUE
 	  DO 102 K = (NM1ALL+NM12ALL+1),NMGENE                     !Trait 2 nonplastic loci
             DO 102 J=1,5
102             RALL(I,K,J) = VMLOCI*(SETALL(J)) + (MBIAS*OPT2(I))
             DO 12 K = (NMGENE+1),(NMGENE+NPGENE)
             DO 12 J=1,5
12              RALL(I,K,J) = VPLLOCI*(SETALL(J)) + PLBIAS
14     CONTINUE
! ****** SET REACTION NORM FUNCTIONS FOR TRAITS 1 AND 2 ********
       XI = 1.0                     
       DO 11 I = 1,NDEME
          B1(I) = SLOPE1 * (CENT + OFFSET1 + XI)
!         B1(I) = OPTMEAN1 + (SLOPE1 * (CENT + OFFSET1 + XI))
          BNEW1(I) = B1(I)
	  B2(I) = SLOPE2 * (CENT + OFFSET2 + XI)
!	  B2(I) = OPTMEAN2 + (SLOPE2 * (CENT + OFFSET2 + XI))
          BNEW2(I) = B2(I)
11        XI = XI + 1.0
! ******** IF REACTION NORM CONSISTS OF STEPS *********
       IF (NPSTEP.GT.1) THEN       
         NDS = INT(1.0*NDEME/NPSTEP)    !Base number of demes per step
         DO 26 I = 1,NPSTEP
26          NPST(I) = NDS
         NR = NDEME - (NDS*NPSTEP)      !Remainder number to be distributed
         IF (NR.EQ.0) GOTO 41
         NRR = INT(INT(NR/2.0)+0.5)
         DO 27 I = 1,NRR                !Distribute from bottom up
27          NPST(I) = NPST(I) + 1
         NRRR = NR - NRR - 1
         DO 28 I = NPSTEP,(NPSTEP-NRRR),-1   !Distribute from top down
28          NPST(I) = NPST(I) + 1
! ******** REPLACE REACTION NORM VALUES WITH MEAN FOR EACH STEP ********
41       NST1 = 1
	   NST2 = 0      
	   DO 29 I = 1,NPSTEP
	      NST2 = NST2 + NPST(I)
	      SB1 = 0
	      SB2 = 0
              DO 30 J = NST1,NST2
                 SB1 = SB1 + B1(J) 
30	         SB2 = SB2 + B2(J) 
	      MB1 = SB1/(1.0*NPST(I))
	      MB2 = SB2/(1.0*NPST(I))
	      DO 31 J = NST1,NST2
	         B1(J) = MB1
	         BNEW1(J) = B1(J)
	         B2(J) = MB2
31	         BNEW2(J) = B2(J)
              NST1 = NST1 + NPST(I)
29        CONTINUE
       END IF
       DO 33 I = 1,NDEME
	    EBASE(I) = BASETYPE*(OPT1(I) - OPTMEAN1)
	    BBASE(I) = BASETYPE*B1(I)
33     CONTINUE 
       RETURN
       END
!
!
!
! ****THIS SUBROUTINE INITIALIZES THE POPULATION COMPOSITION ****
       SUBROUTINE POPS(N,RALL,B1,B2,GENO,MCOUNT,NDEME,MR,MAXPOP,
     C                 NT1MEAN,NT2MEAN,NT1PLAST,NT2PLAST,NT1DEVEL,
     C                 NT2DEVEL,NMIGR,NT1PHENO,NT2PHENO,NLIVE,
     C                 NALL,NM1ALL,NM12ALL,NM2ALL,NP1ALL,NP12ALL,
     C                 NP2ALL,NMGENE,NPGENE,ND1ALL,NPHALL,SEED,
     C                 STABIL1,STABIL2,TCONFIG,ECONFIG,PLCONFIG,
     C                 RBIO,RANDEV1,RANDEV2)
       REAL RALL(NDEME,NALL,5),B1(NDEME),B2(NDEME)
       REAL GENO(NDEME,MAXPOP,NLIVE),MEAN,MR,TCONFIG,ECONFIG,PLCONFIG
       INTEGER MCOUNT(NDEME),SEED
       INTEGER*4 I,J,K
! ******* FOR THE Jth INDIVIDUAL IN THE Ith DEME ********
       DO 25 I = 1,NDEME
          DO 24 J = 1,N
! ******* CREATE A RANDOM GENOTYPE *********
             DO 21 K = 1,(NMGENE+NPGENE)
                L = INT((5.0*RAN(SEED)) + 1.0)
                GENO(I,J,K) = RALL(I,K,L)      !Initialize non-plastic & plastic loci
21           CONTINUE
	     DO 211 K = (NMGENE+NPGENE+1),NPHALL
	        GENO(I,J,K) = 0                !Initialize developmental noise loci
211          CONTINUE
             DO 27 K=(NPHALL+1),NALL
	        GENO(I,J,K) = MR               !Initialize migration loci
27           CONTINUE
! ******* DETERMINE THE PHENOTYPE ********
             MEAN1 = 0
             DO 221 K = 1,(NM1ALL+NM12ALL)
221             MEAN1 = MEAN1 + GENO(I,J,K)      !Sum the non-plastic loci for trait 1
                MEAN2 = 0
             DO 222 K = (NM1ALL+1),NMGENE
222             MEAN2 = MEAN2 + GENO(I,J,K)      !Sum the non-plastic loci for trait 2
             PLAST1 = 0
             DO 231 K = (NMGENE+1),(NMGENE+NP1ALL+NP12ALL)
231             PLAST1 = PLAST1 + GENO(I,J,K)    !Sum the plastic loci for trait 1
             PLAST2 = 0
             DO 232 K = (NMGENE+NP1ALL+1),(NMGENE+NPGENE)
232             PLAST2 = PLAST2 + GENO(I,J,K)    !Sum the plastic loci for trait 2
	     DEVEL1 = 0
	     DO 281 K = (NMGENE+NPGENE+1),(NMGENE+NPGENE+ND1ALL)
281	        DEVEL1 = DEVEL1 + GENO(I,J,K)    !Sum the developmental noise loci for trait 1
	     DEVEL2 = 0
	     DO 282 K = (NMGENE+NPGENE+ND1ALL+1),NPHALL
282	        DEVEL2 = DEVEL2 + GENO(I,J,K)    !Sum the developmental noise loci for trait 2
             PMIG = 0
             DO 26 K = (NPHALL+1),NALL
26              PMIG = PMIG + GENO(I,J,K)         !Sum the migration loci
             RESID1 = (STABIL1*ZMUT(SEED)*ABS(PLAST1)) + !Set the trait 1 residual variation - linked to plasticity
     C		        (ZMUT(SEED)*DEVEL1) +            !Set the trait 1 residual variation - random genetic
     C                  (ZMUT(SEED)*RANDEV1)             !Set the trait 1 residual variation - random nongenetic
             RESID2 = (STABIL2*ZMUT(SEED)*ABS(PLAST2)) + !Set the trait 2 residual variation - linked to plasticity
     C		        (ZMUT(SEED)*DEVEL2) +            !Set the trait 2 residual variation - random genetic
     C                  (ZMUT(SEED)*RANDEV2)             !Set the trait 2 residual variation - random nongenetic
             GENO(I,J,NT1MEAN) = MEAN1
             GENO(I,J,NT2MEAN) = MEAN2
             GENO(I,J,NT1PLAST) = PLAST1
             GENO(I,J,NT2PLAST) = PLAST2
	     GENO(I,J,NT1DEVEL) = DEVEL1
	     GENO(I,J,NT2DEVEL) = DEVEL2
             GENO(I,J,NMIGR) = PMIG
             GENO(I,J,NT1PHENO) = MEAN1 + (B1(I)*PLAST1) + RESID1   !Determine the trait 1 phenotype
             GENO(I,J,NT2PHENO) = MEAN2 + (ECONFIG*B2(I)*PLAST2) +  !Determine the trait 2 phenotype
     C                                  + (PLCONFIG*B1(I)*PLAST1) + !Include effects of plasticity 1 loci
     C            (TCONFIG*GENO(I,J,NT1PHENO)*PLAST2/RBIO) + RESID2 !Relativized effect of trait 2
             GENO(I,J,NLIVE) = 1.0             !Set to "alive"
24        CONTINUE
          MCOUNT(I) = N                        !Set initial population size
25     CONTINUE
       RETURN
       END
!
!
!
! *******THIS SUBROUTINE PERFORMS SINGLE-TRAIT GAUSSIAN SELECTION *****
       SUBROUTINE SELECT1(MCOUNT,GENO,STS,NDEME,MAXPOP,NALL,
     C                    NT1PLAST,NT2PLAST,NT1PHENO,NT2PHENO,
     C                    NLIVE,RCOST1,RCOST2,EOPT,CONSTR,
     C                    HABCOST,MAXDHAB)
       REAL GENO(NDEME,MAXPOP,NLIVE),STS(NDEME),EOPT(NDEME),MAXDHAB
       INTEGER MCOUNT(NDEME),SEED
       INTEGER*4 I,J
       H = -0.5
       DO 32 I = 1,NDEME
          DO 31 J = 1,MCOUNT(I)
             EBUILD = MAXDHAB*(1.0/(1.0+EXP(-5.0*GENO(I,J,NT1PHENO))))
 	     CHAB = CONSTR*HABCOST*EBUILD                       !Cost of habitat construction
	     CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))               !Cost of plasticity for trait 1
	     CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))               !Cost of plasticity for trait 2
             Z = (GENO(I,J,NT2PHENO) - EOPT(I))/STS(I)
             FITNESS = EXP(H * Z * Z) - CT1 - CT2 - CHAB        !Measure fitness
             IF (FITNESS.LT.RAN(SEED)) GENO(I,J,NLIVE) = 0      !Decide fate
31        CONTINUE
32     CONTINUE
       RETURN
       END!
!
!
! *******THIS SUBROUTINE PERFORMS TWO-TRAIT GAUSSIAN SELECTION FOR CONFIGURATIONS 1 AND 3 *****
       SUBROUTINE SELECT2(MCOUNT,GENO,STS,NDEME,MAXPOP,
     C                    NALL,NT1PLAST,NT1PHENO,NT2PLAST,
     C                    NT2PHENO,NLIVE,RCOST1,RCOST2,
     C                    EOPT1,EOPT2,CONSTR,HABCOST,MAXDHAB)
       REAL GENO(NDEME,MAXPOP,NLIVE),STS(NDEME)
       REAL EOPT1(NDEME),EOPT2(NDEME),MAXDHAB
       INTEGER MCOUNT(NDEME),SEED
       INTEGER*4 I,J
       H = -0.5
       DO 32 I = 1,NDEME
          DO 31 J = 1,MCOUNT(I)
             EBUILD = MAXDHAB*(1.0/(1.0+EXP(-5.0*GENO(I,J,NT1PHENO))))
 	     CHAB = CONSTR*HABCOST*EBUILD                       !Cost of habitat construction
	     CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))               !Cost of plasticity for trait 1
             Z1 = (GENO(I,J,NT1PHENO) - EOPT1(I))/STS(I)
             FIT1 = EXP(H * Z1 * Z1)                            !Fitness effect of trait 1
	     CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))               !Cost of plasticity for trait 2
             Z2 = (GENO(I,J,NT2PHENO) - EOPT2(I))/STS(I)
             FIT2 = EXP(H * Z2 * Z2)                            !Fitness effect of trait 2
             FITNESS = (FIT1*FIT2) - CT1 - CT2 - CHAB           !Measure mean fitness
             IF (FITNESS.LT.RAN(SEED)) GENO(I,J,NLIVE) = 0      !Decide fate
31        CONTINUE
32     CONTINUE
       RETURN
       END
!
!
!
! ***** THIS SUBROUTINE PERFORMS SOFT SELECTION REPRODUCTION ******
       SUBROUTINE REPSOFT(N,MCOUNT,GENO,YOUNG,NDEME,MAXPOP,
     C                    NALL,NLIVE,LINKAGE)
       REAL GENO(NDEME,MAXPOP,NLIVE),YOUNG(MAXPOP,NALL)
       REAL LINKAGE
       INTEGER MCOUNT(NDEME),SEED
       INTEGER*4 I,J,K,K3,K4
       IF (LINKAGE.EQ.1.0) THEN
	  GOTO 1
	 ELSE IF (LINKAGE.EQ.0.0) THEN
	    GOTO 2
	 ELSE 
	    GOTO 3
	 END IF
!
! ***** Procedure for complete linkage *******
1      CONTINUE 
! ******** DETERMINE THAT THERE IS AT LEAST 1 LIVE INDIVIDUAL IN THE POPULATION *******
       DO 148 I = 1,NDEME
          DO 140 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.1) GOTO 139
140       CONTINUE
          MCOUNT(I) = 0    !If there are no live individuals
          GOTO 148
139       XI = MCOUNT(I)   !Note population size of Ith deme
! ***** Create offspring by randomly pairing gametes from living individuals ********
          DO 144 J = 1,N
! ******* Choose first parent ********
141          JJ = INT((XI*RAN(SEED)) + 1.0)       !Pick a random individual
             IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 141  !Determine if alive or try again
! ***** Choose one set of linked alleles for first gamete ******
             IF (RAN(SEED).GT.0.5) THEN
	        LINK = 1
	     ELSE
	        LINK = 0
	     END IF
             DO 142 K3 = 1,NALL,2
	        K4 = K3 + LINK
142             YOUNG(J,K3) = GENO(I,JJ,K4)       !Create first half of new genome
! ******* Choose second parent ********
143          JJ = INT((XI*RAN(SEED)) + 1.0)       !Pick another random individual
             IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 143  !Determine if alive or try again
! ******* Choose one of linked alleles for other gamete ********
             IF (RAN(SEED).GT.0.5) THEN
	        LINK = 0
	     ELSE
	        LINK = -1
	     END IF
             DO 149 K3 = 2,NALL,2
		K4 = K3 + LINK
149             YOUNG(J,K3) = GENO(I,JJ,K4)   !Create second half of new genome
144       CONTINUE
! ******* Create next generation from gametes *******
! ******* This step restores the population size to the carrying capacity ******
          DO 147 J = 1,N
             DO 145 K = 1,NALL
145             GENO(I,J,K) = YOUNG(J,K)
147       CONTINUE
          MCOUNT(I) = N         !Record population size
148    CONTINUE
       RETURN                   !End complete linkage and return
!
! ****** Procedure for no linkage *******
2      CONTINUE 
! ******** DETERMINE THAT THERE IS AT LEAST 1 LIVE INDIVIDUAL IN THE POPULATION *******
       DO 48 I = 1,NDEME
          DO 40 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.1) GOTO 39
40        CONTINUE
          MCOUNT(I) = 0    !If there are no live individuals
          GOTO 48
39        XI = MCOUNT(I)   !Note population size of Ith deme          
! ***** Create offspring by randomly pairing gametes from living individuals ********
          DO 44 J = 1,N
! ******* Choose first parent ********
41           JJ = INT((XI*RAN(SEED)) + 1.0)      !Pick a random individual
             IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 41  !Determine if alive or try again
! ******* Choose one of each allele pair for first gamete ********
             DO 42 K3 = 1,NALL,2
                IF (RAN(SEED).GT.0.5) THEN
                   K4 = K3 + 1
                ELSE
                   K4 = K3
                END IF
42              YOUNG(J,K3) = GENO(I,JJ,K4)       !Create first half of new genome
! ******* Choose second parent ********
43           JJ = INT((XI*RAN(SEED)) + 1.0)       !Pick another random individual
             IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 43   !Determine if alive or try again
! ******* Choose one of each allele pair for other gamete ********
             DO 49 K3 = 2,NALL,2
                IF (RAN(SEED).GT.0.5) THEN
                   K4 = K3 - 1
                ELSE
                   K4 = K3
                END IF
49              YOUNG(J,K3) = GENO(I,JJ,K4)   !Create second half of new genome
44        CONTINUE
! ******* Create next generation from gametes *******
! ******* This step restores the population size to the carrying capacity ******
          DO 47 J = 1,N
             DO 45 K = 1,NALL
45              GENO(I,J,K) = YOUNG(J,K)
47        CONTINUE
          MCOUNT(I) = N       !Record population size
48     CONTINUE
       RETURN                 !End no linkage and return
!
! ***** Procedure for partial linkage *******
3      CONTINUE 
       LINK = 0.5 + (LINKAGE/2.0)
! ******** DETERMINE THAT THERE IS AT LEAST 1 LIVE INDIVIDUAL IN THE POPULATION *******
       DO 348 I = 1,NDEME
          DO 340 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.1) GOTO 339
340       CONTINUE
          MCOUNT(I) = 0    !If there are no live individuals
          GOTO 348
339       XI = MCOUNT(I)   !Note population size of Ith deme
! ***** Create offspring by randomly pairing gametes from living individuals ********  
          DO 344 J = 1,N
! ******* Choose first parent ********
341          JJ = INT((XI*RAN(SEED)) + 1.0)       !Pick a random individual
             IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 341  !Determine if alive or try again
! ***** Choose one set of linked alleles for first gamete ******
	        K5 = 1
             DO 342 K3 = 1,NALL,2
	        IF (K5.EQ.1) THEN
		   IF (RAN(SEED).GT.LINK) THEN
                      K4 = K3 + 1
		      K5 = MOD(K4,2)
                    ELSE
                      K4 = K3
		      K5 = MOD(K4,2)
                    END IF
	          ELSE
                    IF (RAN(SEED).GT.LINK) THEN
                       K4 = K3
		       K5 = MOD(K4,2)
                    ELSE
                       K4 = K3 + 1
		       K5 = MOD(K4,2)
                    END IF
	          END IF
342          YOUNG(J,K3) = GENO(I,JJ,K4)          !Create first half of new genome
! ******* Choose second parent ********
343          JJ = INT((XI*RAN(SEED)) + 1.0)       !Pick another random individual
             IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 343  !Determine if alive or try again
! ******* Choose one of linked alleles for other gamete ********
             K5 = 0
             DO 349 K3 = 2,NALL,2
	        IF (K5.EQ.1) THEN
		   IF (RAN(SEED).GT.LINK) THEN
                      K4 = K3
		      K5 = MOD(K4,2)
                    ELSE
                      K4 = K3 - 1
		      K5 = MOD(K4,2)
                    END IF
	          ELSE
                    IF (RAN(SEED).GT.LINK) THEN
                       K4 = K3 - 1
		       K5 = MOD(K4,2)
                    ELSE
                       K4 = K3
		       K5 = MOD(K4,2)
                    END IF
	         END IF 
349              YOUNG(J,K3) = GENO(I,JJ,K4)   !Create second half of new genome
344       CONTINUE
! ******* Create next generation from gametes *******
! ******* This step restores the population size to the carrying capacity ******
          DO 347 J = 1,N
             DO 345 K = 1,NALL
345             GENO(I,J,K) = YOUNG(J,K)
347       CONTINUE
          MCOUNT(I) = N       !Record population size
348    CONTINUE
       RETURN                 !End partial linkage and return
       END
!
!
!
!****** THIS SUBROUTINE REDUCES THE DEME SIZE TO THE CARRYING CAPACITY *******
       SUBROUTINE MORTAL(MCOUNT,GENO,NDEME,MAXPOP,NLIVE,NPOP,NQ1,NQ2)
       REAL GENO(NDEME,MAXPOP,NLIVE)
       INTEGER MCOUNT(NDEME),NQ1(MAXPOP),NQ2(MAXPOP),SEED
       INTEGER*4 I,J,K,N
       DO 1 I = 1,NDEME
	  HLIVE = 0
	  DO 6 J = 1,MCOUNT(I)
6	     IF (GENO(I,J,NLIVE).EQ.1) HLIVE = HLIVE + 1  !Count live individuals
	     IF (HLIVE.LE.NPOP) GOTO 1
	     IND = 0
	     DO 2 J = 1,MCOUNT(I)
	        IF (GENO(I,J,NLIVE).EQ.0) GOTO 2          !Skip dead individuals
	        IND = IND + 1
		NQ1(IND) = J                              !Create picking queue
		GENO(I,J,NLIVE) = 0                       !Set all live individuals to "dead"
2         CONTINUE
	     DO 3 K = 1,NPOP                              !Set population to carrying capacity
	        NP = INT(IND*RAN(SEED) + 1.0)
                GENO(I,NQ1(NP),NLIVE) = 1.0               !Resurrect chosen individual
	        N = 0
	        DO 4 KK = 1,IND
	           IF (KK.EQ.NP) GOTO 4
                   N = N + 1
	           NQ2(N) = NQ1(KK)                       !Create new queue of remaining individuals
4		   CONTINUE
               IND = IND - 1                              !Decrement number of remaining individuals
	       DO 5 KK = 1,IND
5                 NQ1(KK) = NQ2(KK)                       !Replace old queue with new queue
3         CONTINUE  
1      CONTINUE
       RETURN
       END      
!
!
!
! ***** THIS SUBROUTINE PERFORMS HARD SELECTION REPRODUCTION ******
       SUBROUTINE REPHARD(MCOUNT,GENO,YOUNG,NDEME,MAXPOP,
     C                    NALL,NLIVE,LINKAGE)
       REAL GENO(NDEME,MAXPOP,NLIVE),YOUNG(MAXPOP,NALL)
       REAL LINKAGE
       INTEGER MCOUNT(NDEME),SEED
       INTEGER*4 I,J,JN,JJ,JJJ,K,K3,K4
       IF (LINKAGE.EQ.1.0) THEN
	   GOTO 1
       ELSE IF (LINKAGE.EQ.0.0) THEN
	        GOTO 2
	    ELSE 
	        GOTO 3
       END IF
!
! ***** Procedure for complete linkage *******
1      CONTINUE 
! ******** DETERMINE THAT THERE IS AT LEAST 1 LIVE INDIVIDUAL IN THE POPULATION *******
       DO 148 I = 1,NDEME
          DO 140 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.1) GOTO 139
140       CONTINUE
          MCOUNT(I) = 0    !If there are no live individuals
          GOTO 148
139       XI = MCOUNT(I)   !Note population size of Ith deme
! ***** Create offspring by pairing gametes from living individuals ********
          JJJ = 0
          DO 144 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 144       !Skip if dead
             DO 146 JN = 1,4                          !Live individuals have 4 offspring
! ***** Choose one set of linked alleles for first gamete ******
                JJJ = JJJ + 1                         !Count number of offspring
                IF (RAN(SEED).GT.0.5) THEN
   	           LINK = 1
	        ELSE
	           LINK = 0
	        END IF
                DO 142 K3 = 1,NALL,2
	           K4 = K3 + LINK
142                YOUNG(JJJ,K3) = GENO(I,J,K4)       !Create first half of new genome
! ******* Choose second parent ********
143             JJ = INT((XI*RAN(SEED)) + 1.0)        !Pick a random mate
                IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 143   !Determine if alive or try again
! ******* Choose one of linked alleles for other gamete ********
                IF (RAN(SEED).GT.0.5) THEN
	           LINK = 0
	        ELSE
	           LINK = -1
	        END IF
	        DO 149 K3 = 2,NALL,2
		   K4 = K3 + LINK
149                YOUNG(JJJ,K3) = GENO(I,JJ,K4)       !Create second half of new genome
146          CONTINUE
144       CONTINUE
! ******* Create next generation from gametes *******
          DO 147 J = 1,JJJ
             DO 145 K = 1,NALL
145             GENO(I,J,K) = YOUNG(J,K)
147       CONTINUE
          MCOUNT(I) = JJJ                              !Record population size
148    CONTINUE
       RETURN                                          !End complete linkage and return
!
! ****** Procedure for no linkage *******
2      CONTINUE 
! ******** DETERMINE THAT THERE IS AT LEAST 1 LIVE INDIVIDUAL IN THE POPULATION *******
       DO 48 I = 1,NDEME
          DO 40 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.1) GOTO 39
40        CONTINUE
          MCOUNT(I) = 0    !If there are no live individuals
          GOTO 48
39        XI = MCOUNT(I)   !Note population size of Ith deme          
! ***** Create offspring by pairing gametes from living individuals ********
          JJJ = 0
          DO 44 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 44        !Skip if dead
             DO 46 JN = 1,4                           !Live individuals have 4 offspring
! ******* Choose one of each allele pair for first gamete ********
                JJJ = JJJ + 1                         !Count number of offspring 
                DO 42 K3 = 1,NALL,2
                   IF (RAN(SEED).GT.0.5) THEN
                      K4 = K3 + 1
                   ELSE
                      K4 = K3
                   END IF
42                 YOUNG(JJJ,K3) = GENO(I,J,K4)       !Create first half of new genome
! ******* Choose second parent ********
43              JJ = INT((XI*RAN(SEED)) + 1.0)        !Pick a random mate
                IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 43    !Determine if alive or try again
! ******* Choose one of each allele pair for other gamete ********
                DO 49 K3 = 2,NALL,2
                   IF (RAN(SEED).GT.0.5) THEN
                      K4 = K3 - 1
                   ELSE
                      K4 = K3
                   END IF
49                 YOUNG(JJJ,K3) = GENO(I,JJ,K4)       !Create second half of new genome
46           CONTINUE
44        CONTINUE
! ******* Create next generation from gametes *******
          DO 47 J = 1,JJJ
             DO 45 K = 1,NALL
45              GENO(I,J,K) = YOUNG(J,K)
47        CONTINUE
          MCOUNT(I) = JJJ                              !Record population size
48     CONTINUE
       RETURN                                          !End no linkage and return
!
! ***** Procedure for partial linkage *******
3      CONTINUE 
       LINK = 0.5 + (LINKAGE/2.0)
! ******** DETERMINE THAT THERE IS AT LEAST 1 LIVE INDIVIDUAL IN THE POPULATION *******
       DO 348 I = 1,NDEME
          DO 340 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.1) GOTO 339
340       CONTINUE
          MCOUNT(I) = 0    !If there are no live individuals
          GOTO 348
339       XI = MCOUNT(I)   !Note population size of Ith deme
! ***** Create offspring by randomly pairing gametes from living individuals ********  
          JJJ = 0 
          DO 344 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 344       !Skip if dead
             DO 346 JN = 1,4                          !Live individuals have 4 offspring
! ***** Choose one set of linked alleles for first gamete ******
                JJJ = JJJ + 1                         !Count number of offspring 
	        K5 = 1
                DO 342 K3 = 1,NALL,2
	           IF (K5.EQ.1) THEN
	              IF (RAN(SEED).GT.LINK) THEN
                         K4 = K3 + 1
		         K5 = MOD(K4,2)
                      ELSE
                         K4 = K3
		         K5 = MOD(K4,2)
                      END IF
	           ELSE
                      IF (RAN(SEED).GT.LINK) THEN
                         K4 = K3
		         K5 = MOD(K4,2)
                      ELSE
                         K4 = K3 + 1
		         K5 = MOD(K4,2)
                      END IF
	           END IF
342             YOUNG(JJJ,K3) = GENO(I,J,K4)          !Create first half of new genome
! ******* Choose second parent ********
343             JJ = INT((XI*RAN(SEED)) + 1.0)        !Pick another random individual
                IF (GENO(I,JJ,NLIVE).EQ.0) GOTO 343   !Determine if alive or try again
! ******* Choose one of linked alleles for other gamete ********
                K5 = 0
                DO 349 K3 = 2,NALL,2
	           IF (K5.EQ.1) THEN
		      IF (RAN(SEED).GT.LINK) THEN
                         K4 = K3
			 K5 = MOD(K4,2)
                     ELSE
                         K4 = K3 - 1
			 K5 = MOD(K4,2)
                     END IF
	           ELSE
                     IF (RAN(SEED).GT.LINK) THEN
                        K4 = K3 - 1
		        K5 = MOD(K4,2)
                     ELSE
                        K4 = K3
		        K5 = MOD(K4,2)
                     END IF
	           END IF 
349                YOUNG(JJJ,K3) = GENO(I,JJ,K4)       !Create second half of new genome
346          CONTINUE
344       CONTINUE
! ******* Create next generation from gametes *******
          DO 347 J = 1,JJJ
             DO 345 K = 1,NALL
345             GENO(I,J,K) = YOUNG(J,K)
347       CONTINUE
          MCOUNT(I) = JJJ                              !Record population size
348    CONTINUE
       RETURN                                          !End partial linkage and return
       END
!
!
!
! ****** THIS SUBROUTINE CALCULATES MEAN FITNESS FOR SINGLE-TRAIT SELECTION *****
       SUBROUTINE FITS1(MCOUNT,GENO,STS,OPT,MEANFIT,NDEME,MAXPOP,
     C                  NT1PLAST,NT1PHENO,NT2PLAST,NT2PHENO,NLIVE,
     C                  RCOST1,RCOST2,CONSTR,HABCOST,MAXDHAB)
       REAL GENO(NDEME,MAXPOP,NLIVE),STS(NDEME),OPT(NDEME)
       REAL MEANFIT,MAXDHAB
       INTEGER MCOUNT(NDEME)
       INTEGER*4 I,J
       H = -0.5
       F2 = 0
       DO 52 I = 1,NDEME
          XI = MCOUNT(I)
          F1 = 0
! ******** Compute fitness of each individual *********
          DO 51 J = 1,MCOUNT(I)
             EBUILD = MAXDHAB*(1.0/(1.0+EXP(-5.0*GENO(I,J,NT1PHENO))))
             CHAB = CONSTR*HABCOST*EBUILD                       !Cost of habitat construction
	     CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))               !Cost of plasticity for trait 1
	     CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))               !Cost of plasticity for trait 2
             Z = (GENO(I,J,NT2PHENO) - OPT(I))/STS(I)
             FITNESS = EXP(H * Z * Z) - CT1 - CT2 -CHAB         !Fitness of Jth individual
             F1 = F1 + FITNESS                                  !Sum across individuals
51        CONTINUE
          IF (XI.EQ.0) THEN
             F11 = 0
          ELSE
             F11 = F1/XI                 !Compute mean fitness of Ith deme
          END IF
          F2 = F2 + F11                  !Sum across demes
52     CONTINUE
       MEANFIT = F2/(1.0*NDEME)          !Compute global mean fitness
       RETURN
       END
!
!
!
! ****** THIS SUBROUTINE CALCULATES MEAN FITNESS FOR TWO-TRAIT SELECTION *****
       SUBROUTINE FITS2(MCOUNT,GENO,STS,OPT1,OPT2,MEANFIT,
     C                  NDEME,MAXPOP,NT1PLAST,NT1PHENO,NT2PLAST,
     C             NT2PHENO,NLIVE,RCOST1,RCOST2,CONSTR,HABCOST,MAXDHAB)
       REAL GENO(NDEME,MAXPOP,NLIVE),STS(NDEME),OPT1(NDEME),OPT2(NDEME)
       REAL MEANFIT,MAXDHAB
       INTEGER MCOUNT(NDEME)
       INTEGER*4 I,J
       H = -0.5
       F2 = 0
       DO 52 I = 1,NDEME
          XI = MCOUNT(I)
          F1 = 0
! ******** Compute fitness of each individual *********
          DO 51 J = 1,MCOUNT(I)
             EBUILD = MAXDHAB*(1.0/(1.0+EXP(-5.0*GENO(I,J,NT1PHENO))))
             CHAB = CONSTR*HABCOST*EBUILD                       !Cost of habitat construction
	     CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))               !Cost of plasticity for trait 1
             Z1 = (GENO(I,J,NT1PHENO) - OPT1(I))/STS(I)
             FIT1 = EXP(H * Z1 * Z1)                            !Fitness effect of trait 1
	     CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))               !Cost of plasticity for trait 2
             Z2 = (GENO(I,J,NT2PHENO) - OPT2(I))/STS(I)
             FIT2 = EXP(H * Z2 * Z2)                            !Fitness effect of trait 2
             FITNESS = (FIT1*FIT2) - CT1 - CT2 - CHAB           !Fitness of Jth individual
             F1 = F1 + FITNESS                                  !Sum across individuals
51        CONTINUE
          IF (XI.EQ.0) THEN
             F11 = 0
          ELSE
             F11 = F1/XI                 !Compute mean fitness of Ith deme
          END IF
          F2 = F2 + F11                  !Sum across demes
52     CONTINUE
       MEANFIT = F2/(1.0*NDEME)          !Compute global mean fitness
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE PERFORMS MUTATION *********
       SUBROUTINE MUTATE(MCOUNT,GENO,NDEME,MAXPOP,NALL,NMALL,NPALL,
     C               NDALL,NPHALL,NLIVE,MUTRATE,MGMUT,MUTVAR,MIGVAR,
     C               MAXMIG,MIGTYPE)
       REAL GENO(NDEME,MAXPOP,NLIVE),MUTRATE
       REAL MGMUT,MUTVAR,MIGVAR,MAXMIG
       INTEGER SEED,MCOUNT(NDEME)
       INTEGER*4 I,J,K
       CHARACTER MIGTYPE*4
       DO 75 I = 1,NDEME
          DO 74 J = 1,MCOUNT(I)
! ****** Mutate the Kth allele of the Jth individual in the Ith deme *****
             DO 71 K = 1,(NMALL+NPALL)
                IF (RAN(SEED).LT.MUTRATE) THEN
                   GENO(I,J,K) = GENO(I,J,K) + MUTVAR*ZMUT(SEED)
                END IF
71           CONTINUE
             DO 72 K = (NMALL+NPALL+1),NPHALL
                IF (RAN(SEED).LT.MUTRATE) THEN
                   GENO(I,J,K) = GENO(I,J,K) + MUTVAR*ZMUT(SEED)
	           IF (GENO(I,J,K).LT.0) THEN 
		      GENO(I,J,K) = 0                 !Positive values only for devel noise loci
	           END IF  
                END IF
72           CONTINUE
	     IF (MGMUT.EQ.0.0) THEN 
		GOTO 74
	     ELSE
                DO 77 K = (NPHALL+1),NALL
                   IF (RAN(SEED).LT.MGMUT) THEN
                      GENO(I,J,K) = GENO(I,J,K) + MIGVAR*ZMUT(SEED)
                   END IF
		   IF (GENO(I,J,K).LT.0) THEN 
		      GENO(I,J,K) = 0                      !Positive values only for migration loci
	           END IF
                   IF (MIGTYPE.EQ.'ISLE') THEN
		      IF (GENO(I,J,K).GT.MAXMIG) THEN 
		         GENO(I,J,K) = MAXMIG              !Limit sum to 1.0 for island migration
	              END IF
		   END IF
77              CONTINUE	       
             END IF
74        CONTINUE
75     CONTINUE
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE VARIES THE ENVIRONMENT OF DEVELOPMENT ONLY ********
       SUBROUTINE SETENV1(B,BNEW,NDEME,CNOISE,BNOISE,SPCORR)
       REAL B(NDEME),BNEW(NDEME)
       INTEGER SEED,SPCORR
       IF (SPCORR.EQ.1) THEN 
  	 DO 132 I = 1,NDEME                                     !Each deme varies independently
	    RANENV = ZMUT(SEED)
	    BOLD = BNEW(I)
	    BNEW(I) = B(I)+(CNOISE*(BOLD-B(I)))+                !Randomly vary deme environment
     C           (BNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))        !Autocorrelated noise
132	 CONTINUE
       ELSE
	 RANENV = ZMUT(SEED)                                    !The demes vary together
	 DO 133 I = 1,NDEME  
	    BOLD = BNEW(I)
	    BNEW(I) = B(I)+(CNOISE*(BOLD-B(I)))+                !Randomly vary deme environment
     C	         (BNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))        !Autocorrelated noise
133	 CONTINUE
       END IF
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE VARIES THE ENVIRONMENT OF SELECTION ONLY ********
       SUBROUTINE SETENV2(OPT,EOPT,NDEME,RNOISE,CNOISE,SPCORR)
       REAL OPT(NDEME),EOPT(NDEME)
       INTEGER SEED,SPCORR
       IF (SPCORR.EQ.1) THEN 
	 DO 132 I = 1,NDEME                                     !Each deme varies independently
	    RANENV = ZMUT(SEED)
	    EOLD = EOPT(I)
	    EOPT(I) = OPT(I)+(CNOISE*(EOLD-OPT(I)))+            !Randomly vary deme environment
     C	             (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))    !Autocorrelated noise
132	 CONTINUE
       ELSE
	 RANENV = ZMUT(SEED)                                    !The demes vary together
	 DO 133 I = 1,NDEME
	    EOLD = EOPT(I)
	    EOPT(I) = OPT(I)+(CNOISE*(EOLD-OPT(I)))+            !Randomly vary deme environment
     C	             (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))    !Autocorrelated noise
133	 CONTINUE
       END IF
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE VARIES THE ENVIRONMENT OF SELECTION ONLY WITH HABITAT CONSTRUCTION ********
       SUBROUTINE SETENV2H(EOPT,ELAST,NDEME,RNOISE,CNOISE,SPCORR)
       REAL EOPT(NDEME),ELAST(NDEME)
       INTEGER SEED,SPCORR
       IF (SPCORR.EQ.1) THEN 
	 DO 132 I = 1,NDEME                                     !Each deme varies independently
	    RANENV = ZMUT(SEED)
	    ELAST(I) = (CNOISE*ELAST(I)) +                      !Randomly vary deme environment
     C	               (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))  !Autocorrelated noise
	    ELAST(I) = RNOISE*RANENV                            !Autocorrelated noise
            EOPT(I) = EOPT(I) + ELAST(I)                        !Add noise to constructed environment
132	 CONTINUE
       ELSE
	 RANENV = ZMUT(SEED)                                    !The demes vary together
	 DO 133 I = 1,NDEME  
	    ELAST(I) = (CNOISE*ELAST(I)) +                      !Randomly vary deme environment
     C	               (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))  !Autocorrelated noise
            EOPT(I) = EOPT(I) + ELAST(I)                        !Add noise to constructed environment
133	 CONTINUE
       END IF
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE DOES HABITAT CONSTRUCTION ********
       SUBROUTINE HABITAT(EOPT,BNEW,NDEME,GENO,NLIVE,MAXPOP,
     C                    NT1PHENO,MCOUNT,MAXDHAB,MAXBUILD,RELBIO)
       REAL EOPT(NDEME),BNEW(NDEME),GENO(NDEME,MAXPOP,NLIVE)
       REAL MAXDHAB,MAXBUILD
       INTEGER MCOUNT(NDEME)
       BUILDER = MAXBUILD*MAXDHAB                               !Maximum per deme per generation habitat construction
       DO 132 I = 1,NDEME
	  SBUILD = 0
	  DO 131 J = 1,MCOUNT(I)                              
             EBUILD = MAXDHAB*(1.0/(1.0+EXP(-5.0*GENO(I,J,NT1PHENO)))) !Habitat construction by one individual
             SBUILD = SBUILD + EBUILD                           !Sum across individuals
131       CONTINUE
          TBUILD = (BUILDER*SBUILD)/(1.0+SBUILD)                !Habitat construction by the entire deme
	  EOPT(I) = EOPT(I) + TBUILD                            !Habitat construction effect on selection optimum
	  BNEW(I) = BNEW(I) + (TBUILD/RELBIO)                   !Habitat construction effect on development 
132    CONTINUE
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE DOES HABITAT DECAY BACK TO THE BASELINE ********
       SUBROUTINE DECAY(EBASE,EOPT,BBASE,BNEW,NDEME,DECHAB)
       REAL EBASE(NDEME),EOPT(NDEME),BBASE(NDEME),BNEW(NDEME)
       DO 132 I = 1,NDEME
	  EOPT(I) = EOPT(I) - (DECHAB*(EOPT(I)-EBASE(I)))     !Relax selection environment to baseline
	  BNEW(I) = BNEW(I) - (DECHAB*(BNEW(I)-BBASE(I)))     !Relax development environment to baseline                   
132    CONTINUE
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE VARIES THE ENVIRONMENT OF DEVELOPMENT AND SELECTION TOGETHER ********
       SUBROUTINE SETENV3(OPT,EOPT,B,BNEW,NDEME,RNOISE,CNOISE,BNOISE,
     C                    SPCORR)
       REAL OPT(NDEME),EOPT(NDEME),B(NDEME),BNEW(NDEME)
       INTEGER SEED,SPCORR
       IF (SPCORR.EQ.1) THEN 
	 DO 132 I = 1,NDEME                                     !Each deme varies independently
	    RANENV = ZMUT(SEED)
	    EOLD = EOPT(I)
	    EOPT(I) = OPT(I)+(CNOISE*(EOLD-OPT(I)))+            !Randomly vary deme environment
     C	             (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))    !Autocorrelated noise
	    BOLD = BNEW(I)
	    BNEW(I) = B(I)+(CNOISE*(BOLD-B(I)))+                !Randomly vary deme environment
     C	         (BNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))        !Autocorrelated noise
132	 CONTINUE
       ELSE
	 RANENV = ZMUT(SEED)                                    !The demes vary together
	 DO 133 I = 1,NDEME  
	    EOLD = EOPT(I)
	    EOPT(I) = OPT(I)+(CNOISE*(EOLD-OPT(I)))+            !Randomly vary deme environment
     C	             (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))    !Autocorrelated noise
	    BOLD = BNEW(I)
	    BNEW(I) = B(I)+(CNOISE*(BOLD-B(I)))+                !Randomly vary deme environment
     C	         (BNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))        !Autocorrelated noise
133	 CONTINUE
       END IF
       RETURN
       END

!
!
! *********THIS SUBROUTINE VARIES THE ENVIRONMENT OF DEVELOPMENT AND SELECTION TOGETHER WITH HABITAT CONSTRUCTION ********
       SUBROUTINE SETENV3H(EOPT,ELAST,BNEW,BLAST,NDEME,RNOISE,
     C                     CNOISE,BNOISE,SPCORR)
       REAL EOPT(NDEME),ELAST(NDEME),BNEW(NDEME),BLAST(NDEME)
       INTEGER SEED,SPCORR
       IF (SPCORR.EQ.1) THEN 
	 DO 132 I = 1,NDEME                                     !Each deme varies independently
	    RANENV = ZMUT(SEED)
	    ELAST(I) = (CNOISE*ELAST(I)) +                      !Randomly vary deme environment
     C	             (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))    !Autocorrelated noise
            EOPT(I) = EOPT(I) + ELAST(I)                        !Add noise to constructed environment
	    BLAST(I) = (CNOISE*BLAST(I)) +                      !Randomly vary deme environment
     C	         (BNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))        !Autocorrelated noise
	    BNEW(I) = BNEW(I) + BLAST(I)                        !Add noise to constructed environment
132	 CONTINUE
       ELSE
	 RANENV = ZMUT(SEED)                                    !The demes vary together
	 DO 133 I = 1,NDEME  
	    ELAST(I) = (CNOISE*ELAST(I)) +                      !Randomly vary deme environment
     C	             (RNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))    !Autocorrelated noise
            EOPT(I) = EOPT(I) + ELAST(I)                        !Add noise to constructed environment
	    BLAST(I) = (CNOISE*BLAST(I)) +                      !Randomly vary deme environment
     C	         (BNOISE*RANENV*SQRT(1-(CNOISE*CNOISE)))        !Autocorrelated noise
	    BNEW(I) = BNEW(I) + BLAST(I)                        !Add noise to constructed environment
133	 CONTINUE
       END IF
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE SETS THE ENVIRONMENT TO IDENTICAL FOR BOTH TRAITS ********
       SUBROUTINE EQENV(VAR1,VAR2,NDEME)
       REAL VAR1(NDEME),VAR2(NDEME)
       DO 132 I = 1,NDEME
132       VAR2(I) = VAR1(I)
       RETURN
       END
!
!
!
! *********THIS SUBROUTINE AVERAGES THE ENVIRONMENTS OF TRAITS 1 AND 2********
       SUBROUTINE MEANENV(EOPT1,EOPT2,EOPTM,NDEME)
       REAL EOPT1(NDEME),EOPT2(NDEME),EOPTM(NDEME)
       DO 132 I = 1,NDEME
132       EOPTM(I) = EOPT1(I)                      !Comment out if two traits
!132	    EOPTM(I) = (EOPT1(I)+EOPT2(I))/2.0     !Comment out if only one trait
	 RETURN
	 END
!
!
!
! *********THIS SUBROUTINE DETERMINES THE PHENOTYPE *********
       SUBROUTINE DEVELOP(MCOUNT,BNEW1,BNEW2,GENO,NDEME,MAXPOP,NALL,
     C                    NM1ALL,NM12ALL,NP1ALL,NP12ALL,ND1ALL,NMGENE,
     C                    NPGENE,NPHALL,NMIGR,NT1MEAN,NT2MEAN,NT1PLAST,
     C                    NT2PLAST,NT1DEVEL,NT2DEVEL,NT1PHENO,NT2PHENO,
     C                  NLIVE,STABIL1,STABIL2,TCONFIG,ECONFIG,PLCONFIG,
     C                    RBIO,RANDEV1,RANDEV2)
       REAL BNEW1(NDEME),BNEW2(NDEME),GENO(NDEME,MAXPOP,NLIVE)
       REAL TCONFIG,ECONFIG,MEAN1,MEAN2,PLCONFIG
       INTEGER MCOUNT(NDEME),SEED
       INTEGER*4 I,J,K
       DO 75 I = 1,NDEME
          DO 74 J = 1,MCOUNT(I)
! ******* Compute the individual's phenotype ***********
             MEAN1 = 0
             MEAN2 = 0
             PLAST1 = 0
	     PLAST2 = 0
	     DEVEL1 = 0
	     DEVEL2 = 0
             PMIG = 0
             DO 721 K = 1,(NM1ALL+NM12ALL)
721             MEAN1 = MEAN1 + GENO(I,J,K)      !Sum the non-plastic loci for trait 1
             DO 722 K = (NM1ALL+1),NMGENE
722             MEAN2 = MEAN2 + GENO(I,J,K)      !Sum the non-plastic loci for trait 2
             DO 731 K = (NMGENE+1),(NMGENE+NP1ALL+NP12ALL)
731             PLAST1 = PLAST1 + GENO(I,J,K)    !Sum the plastic loci for trait 1
             DO 732 K = (NMGENE+NP1ALL+1),(NMGENE+NPGENE)
732             PLAST2 = PLAST2 + GENO(I,J,K)    !Sum the plastic loci for trait 1
	     DO 781 K = (NMGENE+NPGENE+1),(NMGENE+NPGENE+ND1ALL)
781	        DEVEL = DEVEL + GENO(I,J,K)      !Sum the developmental noise loci for trait 1
	     DO 782 K = (NMGENE+NPGENE+ND1ALL+1),NPHALL
782	        DEVEL2 = DEVEL + GENO(I,J,K)     !Sum the developmental noise loci for trait 2
             DO 76 K = (NPHALL+1),NALL
76              PMIG = PMIG + GENO(I,J,K)        !Sum the migration loci
             RESID1 = (STABIL1*ZMUT(SEED)*ABS(PLAST1)) + !Set the trait 1 residual variation - linked to plasticity
     C		      (ZMUT(SEED)*DEVEL1) +              !Set the trait 1 residual variation - random genetic
     C                (ZMUT(SEED)*RANDEV1)               !Set the trait 1 residual variation - random nongenetic
             RESID2 = (STABIL2*ZMUT(SEED)*ABS(PLAST2)) + !Set the trait 2 residual variation - linked to plasticity
     C		      (ZMUT(SEED)*DEVEL2) +              !Set the trait 2 residual variation - random genetic
     C                (ZMUT(SEED)*RANDEV2)               !Set the trait 2 residual variation - random nongenetic
             GENO(I,J,NT1MEAN) = MEAN1
             GENO(I,J,NT2MEAN) = MEAN2
             GENO(I,J,NT1PLAST) = PLAST1
             GENO(I,J,NT2PLAST) = PLAST2
	     GENO(I,J,NT1DEVEL) = DEVEL1
	     GENO(I,J,NT2DEVEL) = DEVEL2
             GENO(I,J,NMIGR) = PMIG
             GENO(I,J,NT1PHENO) = MEAN1 + (BNEW1(I)*PLAST1) + RESID1   !Determine the trait 1 phenotype
             GENO(I,J,NT2PHENO) = MEAN2 + (ECONFIG*BNEW2(I)*PLAST2) +  !Determine the trait 2 phenotype
     C                                 + (PLCONFIG*BNEW1(I)*PLAST1) +  !Include effects of plasticity 1 loci
     C            (TCONFIG*GENO(I,J,NT1PHENO)*PLAST2/RBIO) + RESID2    !Relativized effect of trait 2
             GENO(I,J,NLIVE) = 1.0                       !Set to "alive"
74        CONTINUE
75     CONTINUE
       RETURN
       END
!
!
!
! ****** THIS FUNCTION GENERATES A RANDOM STANDARD NORMAL DEVIATE ******
       REAL FUNCTION ZMUT(IDUM)
       DATA ISET/0/
       IF (ISET.EQ.0) THEN
1        V1 = 2.0*RAN(IDUM) - 1.0
         V2 = 2.0*RAN(IDUM) - 1.0
         R = V1**2 + V2**2
         IF (R.GE.1.0.OR.R.EQ.0.0) GOTO 1
         FAC = SQRT(-2.0*LOG(R)/R)
         GSET = V1*FAC
         ZMUT = V2*FAC
         ISET = 1
       ELSE
         ZMUT = GSET
         ISET = 0
       ENDIF
       RETURN
       END
!
!
!
! ****** THIS SUBROUTINE MEASURES METAPOPULATION MEAN VALUES *****
       SUBROUTINE MEASURE(MCOUNT,GENO,POPMEAN,NDEME,MAXPOP,
     C                 NALL,NM1ALL,NM1GENE,NM2GENE,NMGENE,NP1ALL,
     C                 NP1GENE,NP2GENE,NPGENE,ND1ALL,ND2ALL,NPHALL,
     C                 NMGALL,NT1MEAN,NT2MEAN,NT1PLAST,NT2PLAST,
     C               NT1DEVEL,NT2DEVEL,NMIGR,NT1PHENO,NT2PHENO,NLIVE,
     C                 STS,OPT1,OPT2,NPARAM,RCOST1,RCOST2,METAMEAN,
     C                 FCONFIG,CONSTR,HABCOST,MAXDHAB)
       REAL GENO(NDEME,MAXPOP,NLIVE),POPMEAN(NDEME,NPARAM),MAXDHAB
       REAL STS(NDEME),OPT1(NDEME),OPT2(NDEME),METAMEAN(NPARAM)
       DOUBLE PRECISION MT11,MT12,PLT11,PLT12,DT11,DT12,DEMER,DEMER2
       DOUBLE PRECISION MT21,MT22,PLT21,PLT22,DT21,DT22
       DOUBLE PRECISION CM1M2,CM1P1,CM1P2,CM2P1,CM2P2,CP1P2
       DOUBLE PRECISION MG1,MG2,DEME,DEME2,PM1,CPM1,PM28,CPM28,CPM33
       DOUBLE PRECISION PM2,CPM2,PM30,CPM30,PHT11,PHT12,PHT21,PHT22
       DOUBLE PRECISION VMT11,VMT21,VPLT11,VPLT21,VDNT1,VDNT2,VMG1
       DOUBLE PRECISION RSUM,SS,VMT1,VMT2,VPLT1,VPLT2,VDNS1,VDNS2,VMG
       INTEGER MCOUNT(NDEME),FCONFIG
       INTEGER*4 I,J,K
       H = -0.5
       DEME = 0
       DEME2 = 0
       PM1 = 0
       PM2 = 0
       CPM1 = 0
       CPM2 = 0
       PM28 = 0
       PM30 = 0
       CPM28 = 0
       CPM30 = 0
       CPM33 = 0
       DEMER = 0
       DEMER2 = 0
       NDEAD = 0
       DO 62 I = 1,NDEME
       IF (MCOUNT(I).EQ.0) THEN
          DO 67 K = 1,NPARAM
67           POPMEAN(I,K) = 0       
          NDEAD = NDEAD + 1
	    GOTO 62
       ELSE
	  XI = MCOUNT(I)
          VMT11 = 0
          MT11 = 0
          MT12 = 0
          VMT21 = 0
          MT21 = 0
          MT22 = 0
          VPLT11 = 0
          PLT11 = 0
          PLT12 = 0
          VPLT21 = 0
          PLT21 = 0
          PLT22 = 0
	  VDNT1 = 0
          DT11 = 0
          DT12 = 0
	  VDNT2 = 0
          DT21 = 0
          DT22 = 0
	  VMG1 = 0
          MG1 = 0
          MG2 = 0
          CM1M2 = 0
          CM1P1 = 0
          CM1P2 = 0
          CM2P1 = 0
          CM2P2 = 0
          CP1P2 = 0
          PHT11 = 0
	  PHT12 = 0
          PHT21 = 0
          PHT22 = 0
	  F1 = 0
! ******* COMPUTE MEANS, SD, AND CORR FOR EACH DEME ********
          DO 61 J = 1,MCOUNT(I)
! ******* COMPUTE VALUES FOR NON-PLASTIC LOCI ******** 
             RSUM = 0
             SS = 0
	     DO 641 K = 1,NM1GENE
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
641          CONTINUE
             VMT1 = SD(RSUM,SS,NM1GENE)
             RSUM = 0
             SS = 0
	     DO 642 K = (NM1ALL+1),NMGENE
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
642          CONTINUE
             VMT2 = SD(RSUM,SS,NM2GENE)
! ******* COMPUTE VALUES FOR PLASTIC LOCI *******
             RSUM = 0
             SS = 0
             DO 651 K = (NMGENE+1),(NMGENE+NP1GENE)
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
651          CONTINUE
             VPLT1 = SD(RSUM,SS,NP1GENE)
             RSUM = 0
             SS = 0
             DO 652 K = (NMGENE+NP1ALL+1),(NMGENE+NPGENE)
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
652          CONTINUE
             VPLT2 = SD(RSUM,SS,NP2GENE)
! ******* COMPUTE VALUES FOR DEVELOPMENTAL NOISE LOCI *******
             RSUM = 0
             SS = 0
             DO 1651 K = (NMGENE+NPGENE+1),ND1ALL
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
1651         CONTINUE
             VDNS1 = SD(RSUM,SS,ND1ALL)
	     RSUM = 0
             SS = 0
             DO 1652 K = (NMGENE+NPGENE+ND1ALL+1),NPHALL
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
1652         CONTINUE
             VDNS2 = SD(RSUM,SS,ND2ALL)
! ******* COMPUTE VALUES FOR MIGRATION LOCI ******
	     RSUM = 0
             SS = 0
             DO 66 K = (NPHALL+1),NALL
                RSUM = RSUM + GENO(I,J,K)
                SS = SS + GENO(I,J,K)*GENO(I,J,K)
66           CONTINUE
             VMG = SD(RSUM,SS,NMGALL)
! ******* COMPUTE DEME SUMS, SSQ, AND CP **********
             MT11 = MT11 + GENO(I,J,NT1MEAN)
             MT12 = MT12 + GENO(I,J,NT1MEAN)*GENO(I,J,NT1MEAN)
             MT21 = MT21 + GENO(I,J,NT2MEAN)
             MT22 = MT22 + GENO(I,J,NT2MEAN)*GENO(I,J,NT2MEAN)
	     VMT11 = VMT11 + VMT1
	     VMT21 = VMT21 + VMT2
             PLT11 = PLT11 + GENO(I,J,NT1PLAST)
             PLT12 = PLT12 + GENO(I,J,NT1PLAST)*GENO(I,J,NT1PLAST)
             PLT21 = PLT21 + GENO(I,J,NT2PLAST)
             PLT22 = PLT22 + GENO(I,J,NT2PLAST)*GENO(I,J,NT2PLAST)
	     VPLT11 = VPLT11 + VPLT1
	     VPLT21 = VPLT21 + VPLT2
	     DT11 = DT11 + GENO(I,J,NT1DEVEL)
             DT12 = DT12 + GENO(I,J,NT1DEVEL)*GENO(I,J,NT1DEVEL)
	     DT21 = DT21 + GENO(I,J,NT2DEVEL)
             DT22 = DT22 + GENO(I,J,NT2DEVEL)*GENO(I,J,NT2DEVEL)
	     VDNT1 = VDNT1 + VDNS1
	     VDNT2 = VDNT2 + VDNS2
             MG1 = MG1 + GENO(I,J,NMIGR)
             MG2 = MG2 + GENO(I,J,NMIGR)*GENO(I,J,NMIGR)
	     VMG1 = VMG1 + VMG
             CM1M2 = CM1M2 + (GENO(I,J,NT1MEAN) * GENO(I,J,NT2MEAN))
             CM1P1 = CM1P1 + (GENO(I,J,NT1MEAN) * GENO(I,J,NT1PLAST))
             CM1P2 = CM1P2 + (GENO(I,J,NT1MEAN) * GENO(I,J,NT2PLAST))
             CM2P1 = CM2P1 + (GENO(I,J,NT2MEAN) * GENO(I,J,NT1PLAST))
             CM2P2 = CM2P2 + (GENO(I,J,NT2MEAN) * GENO(I,J,NT2PLAST))
             CP1P2 = CP1P2 + (GENO(I,J,NT1PLAST) * GENO(I,J,NT2PLAST))
             PHT11 = PHT11 + GENO(I,J,NT1PHENO)
             PHT12 = PHT12 + GENO(I,J,NT1PHENO)*GENO(I,J,NT1PHENO)
             PHT21 = PHT21 + GENO(I,J,NT2PHENO)
             PHT22 = PHT22 + GENO(I,J,NT2PHENO)*GENO(I,J,NT2PHENO)
61        CONTINUE
! ******* COMPUTE MEAN FITNESS *************
          IF (FCONFIG.EQ.1) THEN                  !For single-trait fitness
             DO 631 J = 1,MCOUNT(I)
                EBUILD = MAXDHAB*(1.0/(1.0+
     C                   EXP(-5.0*GENO(I,J,NT1PHENO))))
 	        CHAB = CONSTR*HABCOST*EBUILD                  !Cost of habitat construction
	        CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))          !Cost of plasticity for trait 1
	        CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))          !Cost of plasticity for trait 2
                Z = (GENO(I,J,NT2PHENO) - OPT2(I))/STS(I)
                FITNESS = EXP(H * Z * Z) - CT1 - CT2 - CHAB   !Fitness of the Jth individual
                F1 = F1 + FITNESS                             !Sum across individuals
631          CONTINUE
          END IF
          IF (FCONFIG.EQ.2) THEN                   !For two-trait fitness
             DO 632 J = 1,MCOUNT(I)
                EBUILD = MAXDHAB*(1.0/(1.0+
     C	  	         EXP(-5.0*GENO(I,J,NT1PHENO))))
 	        CHAB = CONSTR*HABCOST*EBUILD                  !Cost of habitat construction
	        CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))          !Cost of plasticity for trait 1
                Z1 = (GENO(I,J,NT1PHENO) - OPT1(I))/STS(I)
                FIT1 = EXP(H * Z1 * Z1)                       !Fitness effect of trait 1
	        CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))          !Cost of plasticity for trait 2
                Z2 = (GENO(I,J,NT2PHENO) - OPT2(I))/STS(I)
                FIT2 = EXP(H * Z2 * Z2)                       !Fitness effect of trait 2
                FITNESS = (FIT1*FIT2) - CT1 - CT2 -CHAB       !Fitness of the Jth individual
                F1 = F1 + FITNESS                             !Sum across individuals
632          CONTINUE
          END IF
! ******* COMPUTE DEME MEANS, SD AND CORR *********
          POPMEAN(I,1) = MT11/XI
	  POPMEAN(I,2) = MT21/XI
          POPMEAN(I,3) = PLT11/XI
	  POPMEAN(I,4) = PLT21/XI
	  POPMEAN(I,5) = DT11/XI
	  POPMEAN(I,6) = DT21/XI
          POPMEAN(I,7) = MG1/XI
          POPMEAN(I,8) = CORR(MT11,MT12,MT21,MT22,CM1M2,MCOUNT(I))
          POPMEAN(I,9) = CORR(MT11,MT12,PLT11,PLT12,CM1P1,MCOUNT(I))
          POPMEAN(I,10) = CORR(MT11,MT12,PLT21,PLT22,CM1P2,MCOUNT(I))
          POPMEAN(I,11) = CORR(MT21,MT22,PLT11,PLT12,CM2P1,MCOUNT(I))
          POPMEAN(I,12) = CORR(MT21,MT22,PLT21,PLT22,CM2P2,MCOUNT(I))
          POPMEAN(I,13) = CORR(PLT11,PLT12,PLT21,PLT22,CP1P2,MCOUNT(I))
          POPMEAN(I,14) = VMT11/XI
          POPMEAN(I,15) = SD(MT11,MT12,MCOUNT(I))
          POPMEAN(I,16) = VMT21/XI
          POPMEAN(I,17) = SD(MT21,MT22,MCOUNT(I))
          POPMEAN(I,18) = VPLT11/XI
          POPMEAN(I,19) = SD(PLT11,PLT12,MCOUNT(I))
          POPMEAN(I,20) = VPLT21/XI
          POPMEAN(I,21) = SD(PLT21,PLT22,MCOUNT(I))
          POPMEAN(I,22) = VDNT1/XI
          POPMEAN(I,23) = SD(DT11,DT12,MCOUNT(I))
          POPMEAN(I,24) = VDNT2/XI
          POPMEAN(I,25) = SD(DT21,DT22,MCOUNT(I))
	  POPMEAN(I,26) = VMG1/XI
          POPMEAN(I,27) = SD(MG1,MG2,MCOUNT(I))
          POPMEAN(I,28) = PHT11/XI
          POPMEAN(I,29) = SD(PHT11,PHT12,MCOUNT(I))
          POPMEAN(I,30) = PHT21/XI
          POPMEAN(I,31) = SD(PHT21,PHT22,MCOUNT(I))
          POPMEAN(I,32) = F1/XI
	  POPMEAN(I,33) = OPT1(I)
	  POPMEAN(I,34) = OPT1(I)
	  POPMEAN(I,35) = 0
	  POPMEAN(I,36) = 0
	  POPMEAN(I,37) = 0
	  POPMEAN(I,38) = 0
	  POPMEAN(I,39) = 0
       END IF     
62     CONTINUE
! ******* COMPUTE METAPOPULATION MEAN VALUES ********** 
       NDEM = NDEME - NDEAD
       DO 162 K = 1,NPARAM                         
          SUMPOP = 0
          DO 163 I = 1,NDEME 
163          SUMPOP = SUMPOP + POPMEAN(I,K)
162       METAMEAN(K) = SUMPOP/(1.0*NDEM)
! ******* CALCULATE NONPLASTIC AND PHENOTYPE SLOPES/REACTION NORMS *********
       IF (NDEME.GT.1) THEN
          DO 164 I = 1,NDEME
             IF (MCOUNT(I).EQ.0) GOTO 164
             DEME = DEME + I
	     DEME2 = DEME2 + (I*I)
	     PM1 = PM1 + POPMEAN(I,1)
	     CPM1 = CPM1 + (I*POPMEAN(I,1))
	     PM2 = PM2 + POPMEAN(I,2)
	     CPM2 = CPM2 + (I*POPMEAN(I,2))
             PM28 = PM28 + POPMEAN(I,28)
	     CPM28 = CPM28 + (I*POPMEAN(I,28))
             PM30 = PM30 + POPMEAN(I,30)
	     CPM30 = CPM30 + (I*POPMEAN(I,30))
             DEMER = DEMER + OPT1(I)
	     DEMER2 = DEMER2 + (OPT1(I)*OPT1(I))
	     CPM33 = CPM33 + (I*OPT1(I))
164       CONTINUE
	  METAMEAN(34) = SD(DEMER,DEMER2,NDEME)
	  METAMEAN(35) = RSLOPE(DEME,DEME2,PM1,CPM1,NDEM)
          METAMEAN(36) = RSLOPE(DEME,DEME2,PM2,CPM2,NDEM)
	  METAMEAN(37) = RSLOPE(DEME,DEME2,PM28,CPM28,NDEM)
	  METAMEAN(38) = RSLOPE(DEME,DEME2,PM30,CPM30,NDEM)
          METAMEAN(39) = RSLOPE(DEME,DEME2,DEMER,CPM33,NDEM)
      END IF
      RETURN
      END
!
!
!
!
! ****** THIS SUBROUTINE OUTPUTS TRANSIENT VALUES *****
       SUBROUTINE TRANSIENT(NSH,MS,GRAD1,GRAD2,SLOPE1,SLOPE2,BIASM,
     C             BIASPL,MR,NGEN,NM1LOCI,NM12LOCI,NM2LOCI,
     C             NP1LOCI,NP12LOCI,NP2LOCI,ND1LOCI,
     C             ND2LOCI,NMIGL,LINKAGE,VMLOCI,VPLLOCI,MCOUNT,GENO,
     C             NDEME,MAXPOP,NT1MEAN,NT2MEAN,NT1PLAST,NT2PLAST,
     C             NT1DEVEL,NT2DEVEL,NMIGR,NT1PHENO,NT2PHENO,NLIVE,
     C             MEANFIT,ENOISE1,ENOISE2,COST1,COST2,HABCOST,
     C             CNOISE1,CNOISE2,STABIL1,STABIL2,RDEVEL1,RDEVEL2,
     C             BEFORE1,BEFORE2,AFTER1,AFTER2,TCONSTR,SPCORR1,
     C       SPCORR2,FBIAS,FUZ,CM,NGSTEP,NPSTEP,DECHAB,OPT1)
       REAL GENO(NDEME,MAXPOP,NLIVE),DMEAN(15),RSUM(15),OUTS(15)
       REAL MEANFIT,MR,LINKAGE,OPT1(NDEME),elast(ndeme)
       DOUBLE PRECISION MT11,MT12,PLT11,PLT12,DT11,DT12
       DOUBLE PRECISION MT21,MT22,PLT21,PLT22,DT21,DT22
       DOUBLE PRECISION CM1M2,CM1P1,CM1P2,CM2P1,CM2P2,CP1P2
       DOUBLE PRECISION MG1,MG2,ND,ND2,CDM1,CDM2,CDPH1,CDPH2,MT1SUM
       DOUBLE PRECISION PHT1SUM,PHT2SUM,PHT11,PHT21,MT2SUM,NDR,NDR2
       INTEGER MCOUNT(NDEME),VMLOCI,VPLLOCI,TCONSTR
       INTEGER BEFORE1,BEFORE2,AFTER1,AFTER2,SPCORR1,SPCORR2
       INTEGER*4 I,J,K
       DO 3 K = 1,15
3         RSUM(K) = 0
       ND = 0
       ND2 = 0
       CDM1 = 0
       CDM2 = 0
       CDPH1 = 0
       CDPH2 = 0
       NDEAD = 0
       NDR = 0
       NDR2 = 0
       DO 62 I = 1,NDEME
          IF (MCOUNT(I).EQ.0) THEN
          DO 4 K=1,15
4            DMEAN(K) = 0
	  NDEAD = NDEAD + 1
	  GOTO 62
       ELSE
	  XI = MCOUNT(I)
          MT11 = 0
          MT12 = 0
          MT21 = 0
          MT22 = 0
          PLT11 = 0
          PLT12 = 0
          PLT21 = 0
          PLT22 = 0
          DT11 = 0
          DT12 = 0
          DT21 = 0
          DT22 = 0
          MG1 = 0
          MG2 = 0
          CM1M2 = 0
          CM1P1 = 0
          CM1P2 = 0
          CM2P1 = 0
          CM2P2 = 0
          CP1P2 = 0
          PHT11 = 0
          PHT21 = 0
! ******* COMPUTE MEANS AND CORRELATIONS FOR EACH DEME ********
          DO 61 J = 1,MCOUNT(I)
! ******* COMPUTE DEME SUMS, SSQ, AND CP **********
             MT11 = MT11 + GENO(I,J,NT1MEAN)
             MT12 = MT12 + GENO(I,J,NT1MEAN)*GENO(I,J,NT1MEAN)
             MT21 = MT21 + GENO(I,J,NT2MEAN)
             MT22 = MT22 + GENO(I,J,NT2MEAN)*GENO(I,J,NT2MEAN)
             PLT11 = PLT11 + GENO(I,J,NT1PLAST)
             PLT12 = PLT12 + GENO(I,J,NT1PLAST)*GENO(I,J,NT1PLAST)
             PLT21 = PLT21 + GENO(I,J,NT2PLAST)
             PLT22 = PLT22 + GENO(I,J,NT2PLAST)*GENO(I,J,NT2PLAST)
 	     DT11 = DT11 + GENO(I,J,NT1DEVEL)
             DT12 = DT12 + GENO(I,J,NT1DEVEL)*GENO(I,J,NT1DEVEL)
	     DT21 = DT21 + GENO(I,J,NT2DEVEL)
             DT22 = DT22 + GENO(I,J,NT2DEVEL)*GENO(I,J,NT2DEVEL)
             MG1 = MG1 + GENO(I,J,NMIGR)
             MG2 = MG2 + GENO(I,J,NMIGR)*GENO(I,J,NMIGR)
             CM1M2 = CM1M2 + (GENO(I,J,NT1MEAN) * GENO(I,J,NT2MEAN))
             CM1P1 = CM1P1 + (GENO(I,J,NT1MEAN) * GENO(I,J,NT1PLAST))
             CM1P2 = CM1P2 + (GENO(I,J,NT1MEAN) * GENO(I,J,NT2PLAST))
             CM2P1 = CM2P1 + (GENO(I,J,NT2MEAN) * GENO(I,J,NT1PLAST))
             CM2P2 = CM2P2 + (GENO(I,J,NT2MEAN) * GENO(I,J,NT2PLAST))
             CP1P2 = CP1P2 + (GENO(I,J,NT1PLAST) * GENO(I,J,NT2PLAST))
             PHT11 = PHT11 + GENO(I,J,NT1PHENO)
             PHT21 = PHT21 + GENO(I,J,NT2PHENO)
61        CONTINUE
! ******* COMPUTE DEME MEANS AND CORRELATIONS *********
          DMEAN(1) = MT11/XI
	  DMEAN(2) = MT21/XI
          DMEAN(3) = PLT11/XI
	  DMEAN(4) = PLT21/XI
	  DMEAN(5) = DT11/XI
	  DMEAN(6) = DT21/XI
          DMEAN(7) = MG1/XI
          DMEAN(8) = CORR(MT11,MT12,MT21,MT22,CM1M2,MCOUNT(I))
          DMEAN(9) = CORR(MT11,MT12,PLT11,PLT12,CM1P1,MCOUNT(I))
          DMEAN(10) = CORR(MT11,MT12,PLT21,PLT22,CM1P2,MCOUNT(I))
          DMEAN(11) = CORR(MT21,MT22,PLT11,PLT12,CM2P1,MCOUNT(I))
          DMEAN(12) = CORR(MT21,MT22,PLT21,PLT22,CM2P2,MCOUNT(I))
          DMEAN(13) = CORR(PLT11,PLT12,PLT21,PLT22,CP1P2,MCOUNT(I))
          DMEAN(14) = PHT11/XI
          DMEAN(15) = PHT21/XI
       END IF     
       DO 8 K = 1,15
8         RSUM(K) = RSUM(K) + DMEAN(K)
       ND = ND + I
       ND2 = ND2 + (I*I)
       CDM1 = CDM1 + (I*DMEAN(1))
       CDM2 = CDM2 + (I*DMEAN(2))
       CDPH1 = CDPH1 + (I*DMEAN(14))
       CDPH2 = CDPH2 + (I*DMEAN(15))
       NDR = NDR + OPT1(I)
       NDR2 = NDR2 + (OPT1(I)*OPT1(I))
62     CONTINUE
! ****** COMPUTE METAPOPULATION MEANS *******
       NDEM = NDEME - NDEAD
       DO 9 K = 1,15
9         OUTS(K) = RSUM(K)/(NDEM*1.0)
       MT1SUM = RSUM(1)
       MT2SUM = RSUM(2)
       PHT1SUM = RSUM(14)
       PHT2SUM = RSUM(15)
       ST1MEAN = RSLOPE(ND,ND2,MT1SUM,CDM1,NDEM)
       ST2MEAN = RSLOPE(ND,ND2,MT2SUM,CDM2,NDEM)
       ST1PHENO = RSLOPE(ND,ND2,PHT1SUM,CDPH1,NDEM)
       ST2PHENO = RSLOPE(ND,ND2,PHT2SUM,CDPH2,NDEM)
       EOPT = NDR/(NDEM*1.0)
       SDEOPT = SD(NDR,NDR2,NDEM)
! ****** OUTPUT PARAMETERS FOR Nth GENERATION ******
       WRITE (7,92) NSH,MS,NM1LOCI,NM12LOCI,NM2LOCI,NP1LOCI,
     C  NP12LOCI,NP2LOCI,ND1LOCI,ND2LOCI,NMIGL,LINKAGE,VMLOCI,VPLLOCI,
     C  GRAD1,GRAD2,SLOPE1,SLOPE2,NGSTEP,NPSTEP,BIASM,BIASPL,MR,
     C  BEFORE1,BEFORE2,AFTER1,AFTER2,TCONSTR,DECHAB,CNOISE1,CNOISE2,
     C  ENOISE1,ENOISE2,SPCORR1,SPCORR2,STABIL1,STABIL2,RDEVEL1,
     C  RDEVEL2,COST1,COST2,CM,HABCOST,FBIAS,FUZ,NGEN,MEANFIT,
     C  (OUTS(K),K=1,15),ST1MEAN,ST2MEAN,ST1PHENO,ST2PHENO,EOPT,SDEOPT
92     FORMAT (1X,11I4,1X,F5.2,2I3,2(1X,F5.1),2(2X,F5.2),2I4,
     C         2(1X,F4.2),1X,F5.3,5I4,5(1X,F5.2),2I4,4(2X,F6.3),
     C         2(1X,F6.4),4(1X,F5.2),1X,I7,2X,F7.3,21(2X,F7.3))
       RETURN
       END
!
!
!
!! ****** THIS FUNCTION COMPUTES A POPULATION STANDARD DEVIATION ****
       FUNCTION SD(RSUM,SUMSQ,N)
       DOUBLE PRECISION SD,RSUM,SUMSQ,VAR
       IF (N.EQ.0) THEN
          SD = 0
          GOTO 91
       END IF
       VAR = (SUMSQ - ((RSUM*RSUM)/(N*1.0)))/(N*1.0)
       IF (VAR.LE.0) THEN
          SD = 0
       ELSE
          SD = SQRT(VAR)
       END IF
91     RETURN
       END
!
!
!
! ****** THIS FUNCTION COMPUTES A STANDARD ERROR ******
       FUNCTION SE(RSUM,SUMSQ,N)
       DOUBLE PRECISION SE,RSUM,SUMSQ,VAR
       VAR = (SUMSQ - ((RSUM*RSUM)/(N*1.0)))/(N - 1.0)
       IF (VAR.LE.0) THEN
          SE = 0
       ELSE
          SE = SQRT(VAR/(N*1.0))
       END IF
       RETURN
       END
!
!
!
! ******* THIS FUNCTION COMPUTES A CORRELATION *******
       FUNCTION CORR(X1,X2,Y1,Y2,CP,N)
       DOUBLE PRECISION CORR,X1,X2,Y1,Y2,CP
       IF (N.EQ.0) THEN
          CORR = 0
          GOTO 91
       END IF
       SSX = X2 - ((X1*X1)/(N*1.0))
       IF (SSX.LE.0) THEN
          CORR = 0
          GOTO 91
       END IF
       SSY = Y2 - ((Y1*Y1)/(N*1.0))
       IF (SSY.LE.0) THEN
          CORR = 0
          GOTO 91
       END IF
       CORR = (CP - ((X1 * Y1)/(N*1.0))) / SQRT(SSX * SSY)
91     RETURN
       END
!
!
!
! ****** THIS FUNCTION COMPUTES A REGRESSION SLOPE *******
       FUNCTION RSLOPE(X1,X2,Y1,CP,N)
       DOUBLE PRECISION SLOPE,X1,X2,Y1,CP
       IF (N.EQ.0) THEN
          CORR = 0
          GOTO 92
       END IF
       SSX = X2 - ((X1*X1)/(N*1.0))
       IF (SSX.LE.0) THEN
          CORR = 0
          GOTO 92
       END IF
       RSLOPE = (CP - ((X1 * Y1)/(N*1.0))) / SSX
92     RETURN
       END
!
!
!
! ****** THIS SUBROUTINE DOES STEPPING-STONE MIGRATION WITH HABITAT CHOICE ******
       SUBROUTINE MSCHOICE(MCOUNT,NCOUNT,GENO,NDEME,MAXPOP,NMIGR,
     C     	             NLIVE,FUZ,FBIAS,RCOST1,RCOST2,NT1PLAST,
     C                     NT2PLAST,NT1PHENO,NT2PHENO,EOPT1,EOPT2,
     C                     STS,CM,FCONFIG)
       REAL GENO(NDEME,MAXPOP,NLIVE),STS(NDEME)
       REAL EOPT1(NDEME),EOPT2(NDEME)
       INTEGER MCOUNT(NDEME),NCOUNT(NDEME),SEED,FCONFIG
       INTEGER*4 I,J,K
       H = -0.5
       FMAX = FUZ/2.0
! ******* Record current deme sizes ********
       DO 81 I = 1,NDEME
81        NCOUNT(I) = MCOUNT(I)
       DO 85 I = 1,NDEME
! ******* Determine if Jth individual in Ith deme is to migrate to Kth deme *****
          DO 83 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 83                !If dead go to next individual
             IF (FCONFIG.EQ.1) THEN                           !For single-trait fitness
	        CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))          !Cost of plasticity for trait 1
	        CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))          !Cost of plasticity for trait 2
                Z = (GENO(I,J,NT2PHENO) - EOPT2(I))/STS(I)
                FITNESS = EXP(H * Z * Z) - CT1 - CT2          !Fitness effect of trait 2
             END IF
             IF (FCONFIG.EQ.2) THEN                           !For two-trait fitness
	        CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))          !Cost of plasticity for trait 1
                Z1 = (GENO(I,J,NT1PHENO) - EOPT1(I))/STS(I)
                FIT1 = EXP(H * Z1 * Z1)                       !Fitness effect of trait 1
	        CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))          !Cost of plasticity for trait 2
                Z2 = (GENO(I,J,NT2PHENO) - EOPT2(I))/STS(I)
                FIT2 = EXP(H * Z2 * Z2)                       !Fitness effect of trait 2
                FITNESS = (FIT1*FIT2) - CT1 - CT2             !Fitness of Jth individual
             END IF
	     PMOVE = (1-FITNESS)+(FUZ*RAN(SEED)-FMAX-FBIAS)       !Probability of movement
             IF (RAN(SEED).LT.PMOVE) THEN                         !Decide to move
                GOTO 83
	     ELSE
	        IF (RAN(SEED).LT.CM) THEN                         !Determine mortality during movement
	           GENO(I,J,NLIVE) = 0                            !Set individual to "dead"
		   GOTO 83
                ELSE
88                 K = I + (INT(GENO(I,J,NMIGR)*ZMUT(SEED)))    !Determine where migrating
  	           IF (K.EQ.I) GOTO 83
		   IF (K.LT.1) GOTO 88                          !Prevent individual from migrating beyond metapopulation
		   IF (K.GT.NDEME) GOTO 88                      !Prevent individual from migrating beyond metapopulation
87         CONTINUE                                             !Repeat assessment
              IF (FCONFIG.EQ.1) THEN                            !For single-trait fitness
                 Z = (GENO(I,J,NT2PHENO) - EOPT2(K))/STS(K)
                 FITNESS = EXP(H * Z * Z) - CT1 - CT2           !Fitness effect of trait 2
              END IF
              IF (FCONFIG.EQ.2) THEN                            !For two-trait fitness
                 Z1 = (GENO(I,J,NT1PHENO) - EOPT1(K))/STS(K)
                 FIT1 = EXP(H * Z1 * Z1)                        !Fitness effect of trait 1
                 Z2 = (GENO(I,J,NT2PHENO) - EOPT2(K))/STS(K)
                 FIT2 = EXP(H * Z2 * Z2)                        !Fitness effect of trait 2
                 FITNESS = (FIT1*FIT2) - CT1 - CT2              !Fitness of Jth individual
              END IF
 	      PMOVE=(1-FITNESS)+(FUZ*RAN(SEED)-FMAX-FBIAS)      !Probability of movement
              IF (RAN(SEED).LT.PMOVE) THEN                      !Decide to move
                 GOTO 84
              ELSE
	         IF (RAN(SEED).LT.CM) THEN                      !Determine mortality during movement
	            GENO(I,J,NLIVE) = 0                         !Set individual to "dead"
	            GOTO 83
                 ELSE 
                    K2 = K + (INT(GENO(I,J,NMIGR)*ZMUT(SEED)))  !Determine where migrating
 	            IF (K2.EQ.K) GOTO 84
		    IF (K2.LT.1) THEN 
		        K2 = 1
		    ELSE IF (K2.GT.NDEME) THEN  
		        K2 = NDEME
	            ELSE
                        K = K2
       		    END IF 
                    GOTO 87
	         END IF
              END IF
84            NCOUNT(K) = NCOUNT(K) + 1                       !Increment Kth deme size
              DO 82 L = 1,NLIVE
82               GENO(K,NCOUNT(K),L) = GENO(I,J,L)            !Migrate individual
                 GENO(I,J,NLIVE) = 0                          !Set individual in Ith deme to "dead"
              END IF
          END IF
83        CONTINUE
85     CONTINUE
       DO 86 I = 1,NDEME
86        MCOUNT(I) = NCOUNT(I)                               !Record new population sizes
       RETURN
       END
!
!
!
! ****** THIS SUBROUTINE DOES ISLAND MIGRATION WITH HABITAT CHOICE ******
       SUBROUTINE MICHOICE(MCOUNT,NCOUNT,GENO,NDEME,MAXPOP,NMIGR,NLIVE,
     C     	             FUZ,FBIAS,RCOST1,RCOST2,NT1PLAST,NT2PLAST,
     C                     NT1PHENO,NT2PHENO,EOPT1,EOPT2,STS,CM,FCONFIG)
       REAL GENO(NDEME,MAXPOP,NLIVE),STS(NDEME)
       REAL EOPT1(NDEME),EOPT2(NDEME)
       INTEGER MCOUNT(NDEME),NCOUNT(NDEME),SEED,FCONFIG
       INTEGER*4 I,J,K
       H = -0.5
       FMAX = FUZ/2.0
       DN = NDEME + 1.0
! ******* Record current deme sizes ********
       DO 81 I = 1,NDEME
81        NCOUNT(I) = MCOUNT(I)
       DO 85 I = 1,NDEME
! ******* Determine if Jth individual in Ith deme is to migrate to Kth deme - MOVE MULTIPLE TIMES *****
          DO 83 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 83                    !If dead go to next individual   
             IF (GENO(I,J,NMIGR).GT.1) THEN                       !Set genetic-based migration rate
	        GM = 1.0                                          !Set max to 1
	     ELSE
	        GM = GENO(I,J,NMIGR)
	     END IF
             IF (FCONFIG.EQ.1) THEN                           !For single-trait fitness
	        CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))          !Cost of plasticity for trait 1
	        CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))          !Cost of plasticity for trait 2
                Z = (GENO(I,J,NT2PHENO) - EOPT2(I))/STS(I)
                FITNESS = EXP(H * Z * Z) - CT1 - CT2          !Fitness effect of trait 2
             END IF
             IF (FCONFIG.EQ.2) THEN                           !For two-trait fitness
	        CT1 = ABS(RCOST1*GENO(I,J,NT1PLAST))          !Cost of plasticity for trait 1
                Z1 = (GENO(I,J,NT1PHENO) - EOPT1(I))/STS(I)
                FIT1 = EXP(H * Z1 * Z1)                       !Fitness effect of trait 1
	        CT2 = ABS(RCOST2*GENO(I,J,NT2PLAST))          !Cost of plasticity for trait 2
                Z2 = (GENO(I,J,NT2PHENO) - EOPT2(I))/STS(I)
                FIT2 = EXP(H * Z2 * Z2)                       !Fitness effect of trait 2
                FITNESS = (FIT1*FIT2) - CT1 - CT2             !Fitness of Jth individual
             END IF
	     PMOVE = GM*((1-FITNESS)+(FUZ*RAN(SEED)-FMAX-FBIAS))  !Probability of movement
             IF (RAN(SEED).GT.PMOVE) GOTO 83                      !Determine if migrating
             IF (RAN(SEED).LT.CM) THEN                            !Determine mortality during movement
	        GENO(I,J,NLIVE) = 0                               !Set individual to "dead"
                GOTO 83
             ELSE
84              K = INT(DN*RAN(SEED))                             !Determine where migrating               
   	        IF (K.EQ.I) GOTO 84 
		IF (K.EQ.0) GOTO 84 
		IF (K.GT.NDEME) GOTO 84 
                IF (FCONFIG.EQ.1) THEN                            !For single-trait fitness
                Z = (GENO(I,J,NT2PHENO) - EOPT2(K))/STS(K)
                FITNESS = EXP(H * Z * Z) - CT1 - CT2              !Fitness effect of trait 2
                END IF
                IF (FCONFIG.EQ.2) THEN                            !For two-trait fitness
                   Z1 = (GENO(I,J,NT1PHENO) - EOPT1(K))/STS(K)
                   FIT1 = EXP(H * Z1 * Z1) - CT1                 !Fitness effect of trait 1
                   Z2 = (GENO(I,J,NT2PHENO) - EOPT2(K))/STS(K)
                   FIT2 = EXP(H * Z2 * Z2) - CT2                 !Fitness effect of trait 2
                   FITNESS = (FIT1*FIT2) - CT1 - CT2             !Fitness of Jth individual
                END IF
	        PMOVE=GM*((1-FITNESS)+(FUZ*RAN(SEED)-FMAX-FBIAS)) !Probability of movement
                IF (RAN(SEED).GT.PMOVE) GOTO 87                   !Determine if migrating
                IF (RAN(SEED).LT.CM) THEN                         !Determine mortality during movement
		   GENO(I,J,NLIVE) = 0                            !Set individual to "dead"
                   GOTO 83
	        ELSE
	           GOTO 84                                        !Start moving again
	        END IF
             END IF 
87           NCOUNT(K) = NCOUNT(K) + 1                            !Increment Kth deme size
             DO 82 L = 1,NLIVE
82              GENO(K,NCOUNT(K),L) = GENO(I,J,L)                 !Migrate individual
             GENO(I,J,NLIVE) = 0                                  !Set individual in Ith deme to "dead"
83        CONTINUE
85     CONTINUE
       DO 86 I = 1,NDEME
86        MCOUNT(I) = NCOUNT(I)                                   !Record new population sizes
       RETURN
       END
!
!
!
! ****** THIS SUBROUTINE DOES STEPPING-STONE MIGRATION WITHOUT CHOICE ******
       SUBROUTINE MIGSTEP(MCOUNT,NCOUNT,GENO,NDEME,MAXPOP,
     C     	            NMIGR,NLIVE,CM)
       REAL GENO(NDEME,MAXPOP,NLIVE)
       INTEGER MCOUNT(NDEME),NCOUNT(NDEME),SEED
       INTEGER*4 I,J,K
! ******* Record current deme sizes ********
       DO 81 I = 1,NDEME
81        NCOUNT(I) = MCOUNT(I)
       DO 85 I = 1,NDEME
! ******* Determine if Jth individual in Ith deme is to migrate to Kth deme *****
          DO 83 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 83            !If dead go to next individual
87           K = I + (INT(GENO(I,J,NMIGR)*ZMUT(SEED)))    !Determine where migrating
	     IF (K.EQ.I) GOTO 83		          !Not moving
             IF (RAN(SEED).LT.CM) THEN                    !Determine mortality during movement
		GENO(I,J,NLIVE) = 0                       !Set individual to "dead"
                GOTO 83
	     END IF
             IF (K.LT.1) GOTO 87                          !Prevent individual from migrating beyond metapopulation
	     IF (K.GT.NDEME) GOTO 87                      !Prevent individual from migrating beyond metapopulation
             NCOUNT(K) = NCOUNT(K) + 1                    !Increment Kth deme size
             DO 82 L = 1,NLIVE
82              GENO(K,NCOUNT(K),L) = GENO(I,J,L)         !Migrate individual to Kth deme
             GENO(I,J,NLIVE) = 0                          !Set Jth individual in Ith deme to "dead"
83        CONTINUE
85     CONTINUE
       DO 86 I = 1,NDEME
86        MCOUNT(I) = NCOUNT(I)                           !Record new population sizes
       RETURN
       END
!
!
!
! ****** THIS SUBROUTINE DOES ISLAND MIGRATION WITHOUT CHOICE ******
       SUBROUTINE MIGISLE(MCOUNT,NCOUNT,GENO,NDEME,MAXPOP,
     C     	            NMIGR,NLIVE,CM)
       REAL GENO(NDEME,MAXPOP,NLIVE)
       INTEGER MCOUNT(NDEME),NCOUNT(NDEME),SEED
       INTEGER*4 I,J,K
       DN = NDEME + 1.0
! ******* Record current deme sizes ********
       DO 81 I = 1,NDEME
81        NCOUNT(I) = MCOUNT(I)
       DO 85 I = 1,NDEME
! ******* Determine if Jth individual in Ith deme is to migrate to Kth deme *****
          DO 83 J = 1,MCOUNT(I)
             IF (GENO(I,J,NLIVE).EQ.0) GOTO 83            !If dead go to next individual
             IF (RAN(SEED).GT.(GENO(I,J,NMIGR))) GOTO 83  !Determine if migrating
             IF (RAN(SEED).LT.CM) THEN                    !Determine mortality during movement
	        GENO(I,J,NLIVE) = 0                       !Set individual to "dead"
                GOTO 83
	     END IF
84           K = INT(DN*RAN(SEED))                        !Determine where migrating               
   	     IF (K.EQ.I) GOTO 84                          !Same deme, pick again
	     IF (K.EQ.0) GOTO 84                          !Outside metapopulation, pick again
             IF (K.GT.NDEME) GOTO 84                      !Outside metapopulation, pick again
             NCOUNT(K) = NCOUNT(K) + 1                    !Increment Kth deme size
             DO 82 L = 1,NLIVE
82              GENO(K,NCOUNT(K),L) = GENO(I,J,L)         !Migrate individual to Kth deme
             GENO(I,J,NLIVE) = 0                          !Set individual in Ith deme to "dead"
83        CONTINUE
85     CONTINUE
       DO 86 I = 1,NDEME
86        MCOUNT(I) = NCOUNT(I)                           !Record new population sizes
       RETURN
       END
!
!
!
! *******THIS SUBROUTINE INPUTS METAPOPULATION FILE LOCATION INFORMATION***********
       SUBROUTINE INOUT 
       CHARACTER*64 OUTNAME,OV*1
    5  WRITE (*,6) 
    6  FORMAT ('Enter the path and name of the output file: ',$)    
       READ (*,'(A)') OUTNAME
       OPEN (unit=8,file=OUTNAME,status='new',ERR=10)
       RETURN                       
   10  WRITE (*,*) 'File already exists.' 
   11  WRITE (*,*) 'Do you wish to overwrite (Y or N)?'
       READ (*,'(A)') OV
       IF (OV.EQ.'N'.OR.OV.EQ.'n') THEN 
          GOTO 5
       ELSE IF (OV.EQ.'Y'.OR.OV.EQ.'y') THEN
          OPEN (unit=8,file=OUTNAME,status='old')
       ELSE
          GOTO 11
       END IF
       RETURN 
       END
!
!
!
! *******THIS SUBROUTINE INPUTS TRANSIENT FILE LOCATION INFORMATION***********
       SUBROUTINE TRANSOUT(NOTRANS) 
       CHARACTER*64 OUTNAME,OV*1
       NOTRANS = 1
    3  WRITE (*,*) 'Do you want to record transient values (Y or N)?'
       READ (*,'(A)') OV
       IF (OV.EQ.'N'.OR.OV.EQ.'n') THEN 
          NOTRANS = 0
          GOTO 2
       ELSE IF (OV.EQ.'Y'.OR.OV.EQ.'y') THEN
          NOTRANS = 1
	  GOTO 5
       ELSE
	  GOTO 3
       END IF
    2  RETURN
    5  WRITE (*,6) 
    6  FORMAT ('Enter the name of the transient output file: ',$)    
       READ (*,'(A)') OUTNAME
       OPEN (unit=7,file=OUTNAME,status='new',ERR=10)
       RETURN                       
   10  WRITE (*,*) 'File already exists.' 
   11  WRITE (*,*) 'Do you wish to overwrite (Y or N)?'
       READ (*,'(A)') OV
       IF (OV.EQ.'N'.OR.OV.EQ.'n') THEN 
          GOTO 5
       ELSE IF (OV.EQ.'Y'.OR.OV.EQ.'y') THEN
          OPEN (unit=7,file=OUTNAME,status='old')
       ELSE
          GOTO 11
       END IF
       RETURN 
       END   
!
!
!
! ******* THIS SUBROUTINE WRITES TRANSIENT METADATA ********
       SUBROUTINE TRANSMETA(NDEME,CHOICE,CONSTR,BASETYPE,FCONFIG,
     C	     TCONFIG,ECONFIG,PLCONFIG,ENVSAME,ENVMEAN,MIGTYPE,NPOP,
     C   MAXPOP,NREP,OPTMEAN1,OFFSET1,OPTMEAN2,OFFSET2,WIDTH,MUTRATE,
     C                      MUTVAR,MGMUT,MIGVAR,MAXDHAB,MAXBUILD) 
       CHARACTER GTYPE*4,PLTYPE*4,MIGTYPE*4,CHOICE*1,RUDATE*24
       REAL MUTRATE,MUTVAR,MGMUT,MIGVAR,TCONFIG,ECONFIG,PLCONFIG
       REAL MAXDHAB,MAXBUILD
       INTEGER FCONFIG,ENVSAME,ENVMEAN
       CALL FDATE(RUDATE)
       WRITE (7,1)
    1  FORMAT ('METADATA')
       WRITE (7,101)
  101  FORMAT ('Program: NICHE version 10')
       WRITE (7,2) RUDATE
    2  FORMAT ('Date file was generated: ',A24)              
       WRITE (7,45) 
       WRITE (7,3)
    3  FORMAT ('Simulation parameters:')
       WRITE (7,301) CHOICE
  301  FORMAT ('Habitat choice is ',A1,' (Y(es) or N(o))')
       WRITE (7,3011) CONSTR
 3011  FORMAT ('Habitat construction is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (7,3012) BASETYPE
 3012  FORMAT ('Slope of baseline is ',F3.1,' 1(optimum) OR 0(none)')
       WRITE (7,3013) MAXDHAB
 3013  FORMAT('Maximum individual habitat construction effect is ',F4.1)
       WRITE (7,3014) MAXBUILD
 3014  FORMAT ('Individual build multiplier maximum is ',F4.1)
       WRITE (7,302) FCONFIG 
  302  FORMAT ('The fitness configuration is ',I1,' (single OR double)')
       WRITE (7,303) TCONFIG 
  303  FORMAT ('The trait 1 effect on trait 2 is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (7,304) ECONFIG 
  304  FORMAT ('The environ effect on trait 2 is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (7,3042) PLCONFIG 
 3042  FORMAT ('The plast1 effect on trait 2 is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (7,305) ENVSAME 
  305  FORMAT ('The environ effect is sim/ident ',I1,' 0(N) 1(S) 2(I)')
       WRITE (7,3052) ENVMEAN 
 3052  FORMAT ('The selection environ is averaged ',I1,' 1(Y) OR 0(N)')
       WRITE (7,4) NDEME 
    4  FORMAT ('The number of demes is ',I3)
       WRITE (7,171) MIGTYPE
  171  FORMAT ('The migration pattern is ',A4)
       WRITE (7,8) NPOP
    8  FORMAT ('The carry capacity is ',I4)
       WRITE (7,9) MAXPOP 
    9  FORMAT ('The maximum population size after migration is ',I4)
       WRITE (7,10) NREP
   10  FORMAT ('The number of replicates per parameter set is ',I3)
       WRITE (7,11) OPTMEAN1
   11  FORMAT ('The Y axis gradient offset for trait 1 is ',F4.1) 
       WRITE (7,111) OPTMEAN2
  111  FORMAT ('The Y axis gradient offset for trait 2 is ',F4.1)     
       WRITE (7,12) OFFSET1
   12  FORMAT ('The X axis gradient offset for trait 1 is ',F4.1)
       WRITE (7,121) OFFSET2
  121  FORMAT ('The X axis gradient offset for trait 2 is ',F4.1)
       WRITE (7,49) WIDTH
   49  FORMAT ('The width of the selection function is  ',F5.2)
       WRITE (7,17) MUTRATE
   17  FORMAT ('The phenotype mutation rate is ',F6.4)
       WRITE (7,18) MUTVAR
   18  FORMAT ('The standard deviation of phenotype mutation is ',F6.3)
       WRITE (7,47) MGMUT
   47  FORMAT ('The migration mutation rate is ',F6.4)
       WRITE (7,48) MIGVAR
   48  FORMAT ('The standard deviation of migration mutation is ',F6.3)    
       WRITE (7,45)
       WRITE (7,19)
   19  FORMAT ('The data columns are:')
       WRITE (7,72)
   72  FORMAT ('1 = Soft/hard selection (1=soft)')
       WRITE (7,61)
   61  FORMAT ('2 = Move/select order (1=move first)')
       WRITE (7,13) 
   13  FORMAT ('3 = The number of non-plastic loci of trait 1')
       WRITE (7,1322) 
 1322  FORMAT ('4 = The number of shared non-plastic loci')
       WRITE (7,132) 
  132  FORMAT ('5 = The number of non-plastic loci of trait 2')
       WRITE (7,14) 
   14  FORMAT ('6 = The number of plastic loci of trait 1')
       WRITE (7,1422) 
 1422  FORMAT ('7 = The number of shared plastic loci')
       WRITE (7,142) 
  142  FORMAT ('8 = The number of plastic loci of trait 2')
       WRITE (7,141) 
  141  FORMAT ('9 = The number of developmental noise loci of trait 1')
       WRITE (7,1412) 
 1412  FORMAT ('10 = The number of developmental noise loci of trait 2')
       WRITE (7,16) 
   16  FORMAT ('11 = The number of migration loci')
       WRITE (7,51)
   51  FORMAT ('12 = The strength of genetic linkage')
       WRITE (7,52)
   52  FORMAT ('13 = Initial genetic variation of mean loci')
       WRITE (7,53)
   53  FORMAT ('14 = Initial genetic variation of plasticity loci')
       WRITE (7,20)
   20  FORMAT('15 = The slope of optimal phenotype function of trait 1')
       WRITE (7,202)
  202  FORMAT('16 = The slope of optimal phenotype function of trait 2')
       WRITE (7,22)
   22  FORMAT ('17 = The slope of the plasticity function of trait 1')
       WRITE (7,222)
  222  FORMAT ('18 = The slope of the plasticity function of trait 2')
       WRITE (7,122)
  122  FORMAT ('19 = The number of environment steps')
       WRITE (7,123)
  123  FORMAT ('20 = The number of reaction norm steps')
       WRITE (7,50)
   50  FORMAT('21 = The bias in the initial non-plastic allelic values')
       WRITE (7,23)
   23  FORMAT ('22 = The bias in the initial plasticity allelic values')
       WRITE (7,24)
   24  FORMAT ('23 = The initial migration rate')
       WRITE (7,60)
   60  FORMAT ('24 = Envir change before devel (1=no,3=linked)-trait 1')
       WRITE (7,602)
  602  FORMAT ('25 = Envir change before devel (1=no,3=linked)-trait 2')
       WRITE (7,161)
  161  FORMAT ('26 = Environ change after development (1=no)-trait 1')
       WRITE (7,1612)
 1612  FORMAT ('27 = Environ change after development (1=no)-trait 2')
       WRITE (7,1613)
 1613  FORMAT ('28 = Timing of habitat construction')
       WRITE (7,1614)
 1614  FORMAT ('29 = Rate of habitat decay')
       WRITE (7,62)
   62  FORMAT ('30 = The temporal autocorr of environ noise - trait 1')
       WRITE (7,623)
  623  FORMAT ('31 = The temporal autocorr of environ noise - trait 2')
       WRITE (7,622)
  622  FORMAT ('32 = The SD of environ noise at selection - trait 1')
       WRITE (7,6222)
 6222  FORMAT ('33 = The SD of environ noise at selection - trait 2')
       WRITE (7,63)
   63  FORMAT ('34 = The spat autocorr of envir noise (1=no) - trait 1')
       WRITE (7,632)
  632  FORMAT ('35 = The spat autocorr of envir noise (1=no) - trait 2')
       WRITE (7,75)
   75  FORMAT ('36 = The effect of plast on devel noise - trait 1')
       WRITE (7,752)
  752  FORMAT ('37 = The effect of plast on devel noise - trait 2')
       WRITE (7,275)
  275  FORMAT ('38 = The magnitude of nongenetic devel noise - trait 1')
       WRITE (7,2752)
 2752  FORMAT ('39 = The magnitude of nongenetic devel noise - trait 2')
       WRITE (7,73)
   73  FORMAT ('40 = The cost of plasticity - trait 1')
       WRITE (7,732)
  732  FORMAT ('41 = The cost of plasticity - trait 2')
       WRITE (7,173)
  173  FORMAT ('42 = The cost of dispersal')
       WRITE (7,1731)
 1731  FORMAT ('43 = The cost of habitat construction')
       WRITE (7,174)
  174  FORMAT ('44 = Bias in environmental assessment')
       WRITE (7,175)
  175  FORMAT ('45 = Error in environmental assessmemt')
       WRITE (7,29)
   29  FORMAT ('46-68 = Transient parameters for the first replicate:')
       WRITE (7,26)
   26  FORMAT ('46 = The generation number')
       WRITE (7,27)
   27  FORMAT ('47 = Mean fitness across demes')
       WRITE (7,30)
   30  FORMAT ('48 = Mean of non-plastic loci - trait 1')
       WRITE (7,3022)
 3022  FORMAT ('49 = Mean of non-plastic loci - trait 2') 
       WRITE (7,31)
   31  FORMAT ('50 = Mean of plastic loci - trait 1') 
       WRITE (7,312)
  312  FORMAT ('51 = Mean of plastic loci - trait 2') 
       WRITE (7,131)
  131  FORMAT ('52 = Mean of develop noise loci - trait 1') 
       WRITE (7,1312)
 1312  FORMAT ('53 = Mean of develop noise loci - trait 2') 
       WRITE (7,32)
   32  FORMAT ('54 = Mean of migration loci') 
       WRITE (7,33)
   33  FORMAT ('55 = Correl of non-plastic - traits 1 & 2')
       WRITE (7,331)
  331  FORMAT ('56 = Correl of non-plast & plast - trait 1')
       WRITE (7,332)
  332  FORMAT ('57 = Correl of non-plast - T1 & plast - T2')
       WRITE (7,333)
  333  FORMAT ('58 = Correl of non-plast - T2 & plast - T1')
       WRITE (7,334)
  334  FORMAT ('59 = Correl of non-plast & plast - trait 2')
       WRITE (7,335)
  335  FORMAT ('60 = Correl of plastic - traits 1 & 2')
       WRITE (7,36)
   36  FORMAT ('61 = Mean phenotype - trait 1')   
       WRITE (7,362)
  362  FORMAT ('62 = Mean phenotype - trait 2')             
       WRITE (7,37)
   37  FORMAT ('63 = Slope of non-plastic loci - trait 1') 
       WRITE (7,372)
  372  FORMAT ('64 = Slope of non-plastic loci - trait 2')       
       WRITE (7,38)
   38  FORMAT ('65 = Slope of mean phenotype - trait 1')  
       WRITE (7,382)
  382  FORMAT ('66 = Slope of mean phenotype - trait 2')     
       WRITE (7,433)
  433  FORMAT ('67 = Mean amount of habitat construction') 
       WRITE (7,434)
  434  FORMAT ('68 = SD of mean habitat construction')    
       WRITE (7,45)
       WRITE (7,44)
   44  FORMAT ('THE TRANSIENT DATA ARE:')
   45  FORMAT ('    ')
       RETURN
       END
!
!
!       
! ******* THIS SUBROUTINE WRITES METAPOPULATION METADATA ********
       SUBROUTINE METADATA(NDEME,CHOICE,CONSTR,BASETYPE,FCONFIG,TCONFIG,
     C	                 ECONFIG,PLCONFIG,ENVSAME,ENVMEAN,MIGTYPE,
     C                     NPOP,MAXPOP,NREP,TGEN,OPTMEAN1,OFFSET1,
     C                     OPTMEAN2,OFFSET2,WIDTH,
     C                     MUTRATE,MUTVAR,MGMUT,MIGVAR,MAXDHAB,MAXBUILD) 
       CHARACTER GTYPE*4,PLTYPE*4,MIGTYPE*4,CHOICE*1,RUDATE*24 
       REAL MUTRATE,MUTVAR,MGMUT,MIGVAR,TCONFIG,ECONFIG,PLCONFIG
       REAL MAXDHAB,MAXBUILD
       INTEGER TGEN,FCONFIG,ENVSAME,ENVMEAN
       CALL FDATE(RUDATE)
       WRITE (8,1)
    1  FORMAT ('METADATA')
       WRITE (8,101)
  101  FORMAT ('Program: NICHE version 10')       
       WRITE (8,2) RUDATE
    2  FORMAT ('Date file was generated: ',A24)       
       WRITE (8,45)
       WRITE (8,3)
    3  FORMAT ('Simulation parameters:')
       WRITE (8,301) CHOICE
  301  FORMAT ('Habitat choice is ',A1,' (Y(es) or N(o))')
       WRITE (8,3011) CONSTR
 3011  FORMAT ('Habitat construction is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (8,3012) BASETYPE
 3012  FORMAT ('Slope of baseline is ',F3.1,' 1(optimum) OR 0(none)')
       WRITE (8,3013) MAXDHAB
 3013  FORMAT('Maximum individual habitat construction effect is ',F4.1)
       WRITE (8,3014) MAXBUILD
 3014  FORMAT ('Individual build multiplier maximum is ',F4.1)
       WRITE (8,302) FCONFIG 
  302  FORMAT ('The fitness configuration is ',I1,' (single OR double)')
       WRITE (8,303) TCONFIG 
  303  FORMAT ('The trait 1 effect on trait 2 is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (8,304) ECONFIG 
  304  FORMAT ('The environ effect on trait 2 is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (8,3042) PLCONFIG 
 3042  FORMAT ('The plast1 effect on trait 2 is ',F3.1,' 1(Y) OR 0(N)')
       WRITE (8,305) ENVSAME 
  305  FORMAT ('The environ effect is sim/ident ',I1,' 0(N) 1(S) 2(I)')
       WRITE (8,3052) ENVMEAN 
 3052  FORMAT ('The selection environ is averaged ',I1,' 1(Y) OR 0(N)')
       WRITE (8,4) NDEME 
    4  FORMAT ('The number of demes is ',I3)
       WRITE (8,171) MIGTYPE
  171  FORMAT ('The migration pattern is ',A4)
       WRITE (8,8) NPOP
    8  FORMAT ('The carry capacity is ',I4)
       WRITE (8,9) MAXPOP 
    9  FORMAT ('The maximum population size after migration is ',I4)
       WRITE (8,10) NREP
   10  FORMAT ('The number of replicates per parameter set is ',I3)
	 WRITE (8,54) TGEN
   54  FORMAT ('The maximum number of generations is ',I7)
       WRITE (8,11) OPTMEAN1
   11  FORMAT ('The Y axis gradient offset for trait 1 is ',F4.1) 
       WRITE (8,111) OPTMEAN2
  111  FORMAT ('The Y axis gradient offset for trait 2 is ',F4.1)     
       WRITE (8,12) OFFSET1
   12  FORMAT ('The X axis gradient offset for trait 1 is ',F4.1)
       WRITE (8,121) OFFSET2
  121  FORMAT ('The X axis gradient offset for trait 2 is ',F4.1)
       WRITE (8,49) WIDTH
   49  FORMAT ('The width of the selection function is  ',F5.2)
       WRITE (8,17) MUTRATE
   17  FORMAT ('The phenotype mutation rate is ',F6.4)
       WRITE (8,18) MUTVAR
   18  FORMAT ('The standard deviation of phenotype mutation is ',F6.3)
       WRITE (8,47) MGMUT
   47  FORMAT ('The migration mutation rate is ',F6.4)
       WRITE (8,48) MIGVAR
   48  FORMAT ('The standard deviation of migration mutation is ',F6.3)    
       WRITE (8,45)
       WRITE (8,19)
   19  FORMAT ('The data columns are:')
       WRITE (8,72)
   72  FORMAT ('1 = Soft/hard selection (1=soft)')
       WRITE (8,61)
   61  FORMAT ('2 = Move/select order (1=move first)')
       WRITE (8,13) 
   13  FORMAT ('3 = The number of non-plastic loci of trait 1')
       WRITE (8,1312) 
 1312  FORMAT ('4 = The number of shared non-plastic loci')
       WRITE (8,132) 
  132  FORMAT ('5 = The number of non-plastic loci of trait 2')
       WRITE (8,14) 
   14  FORMAT ('6 = The number of plastic loci of trait 1')
       WRITE (8,1412) 
 1412  FORMAT ('7 = The number of shared plastic loci')
       WRITE (8,142) 
  142  FORMAT ('8 = The number of plastic loci of trait 2')
       WRITE (8,141) 
  141  FORMAT ('9 = The number of developmental noise loci of trait 1')
       WRITE (8,1422) 
 1422  FORMAT ('10 = The number of developmental noise loci of trait 2')
       WRITE (8,16) 
   16  FORMAT ('11 = The number of migration loci')
       WRITE (8,51)
   51  FORMAT ('12 = The strength of genetic linkage')
       WRITE (8,52)
   52  FORMAT ('13 = Initial genetic variation of mean loci')
       WRITE (8,53)
   53  FORMAT ('14 = Initial genetic variation of plasticity loci')
       WRITE (8,20)
   20  FORMAT('15 = The slope of optimal phenotype function of trait 1')
       WRITE (8,202)
  202  FORMAT('16 = The slope of optimal phenotype function of trait 2')
       WRITE (8,22)
   22  FORMAT ('17 = The slope of the plasticity function of trait 1')
       WRITE (8,222)
  222  FORMAT ('18 = The slope of the plasticity function of trait 2')
       WRITE (8,122)
  122  FORMAT ('19 = The number of environment steps')
       WRITE (8,123)
  123  FORMAT ('20 = The number of reaction norm steps')
       WRITE (8,50)
   50  FORMAT('21 = The bias in the initial non-plastic allelic values')
       WRITE (8,23)
   23  FORMAT ('22 = The bias in the initial plasticity allelic values')
       WRITE (8,24)
   24  FORMAT ('23 = The initial migration rate')
       WRITE (8,60)
   60  FORMAT ('24 = Envir change before devel (1=no,3=linked)-trait 1')
       WRITE (8,602)
  602  FORMAT ('25 = Envir change before devel (1=no,3=linked)-trait 2')
       WRITE (8,161)
  161  FORMAT ('26 = Environ change after development (1=no)-trait 1')
       WRITE (8,1612)
 1612  FORMAT ('27 = Environ change after development (1=no)-trait 2')
       WRITE (8,1613)
 1613  FORMAT ('28 = Timing of habitat construction')
       WRITE (8,1614)
 1614  FORMAT ('29 = Rate of habitat decay')
       WRITE (8,62)
   62  FORMAT ('30 = The temporal autocorr of environ noise - trait 1')
       WRITE (8,623)
  623  FORMAT ('31 = The temporal autocorr of environ noise - trait 2')
       WRITE (8,622)
  622  FORMAT ('32 = The SD of environ noise at selection - trait 1')
       WRITE (8,6222)
 6222  FORMAT ('33 = The SD of environ noise at selection - trait 2')
       WRITE (8,63)
   63  FORMAT ('34 = The spat autocorr of envir noise (1=no) - trait 1')
       WRITE (8,632)
  632  FORMAT ('35 = The spat autocorr of envir noise (1=no) - trait 2')
       WRITE (8,75)
   75  FORMAT ('36 = The effect of plast on devel noise - trait 1')
       WRITE (8,752)
  752  FORMAT ('37 = The effect of plast on devel noise - trait 2')
       WRITE (8,275)
  275  FORMAT ('38 = The magnitude of nongenetic devel noise - trait 1')
       WRITE (8,2752)
 2752  FORMAT ('39 = The magnitude of nongenetic devel noise - trait 2')
       WRITE (8,73)
   73  FORMAT ('40 = The cost of plasticity - trait 1')
       WRITE (8,732)
  732  FORMAT ('41 = The cost of plasticity - trait 2')
       WRITE (8,173)
  173  FORMAT ('42 = The cost of dispersal')
       WRITE (8,1731)
 1731  FORMAT ('43 = The cost of habitat construction')
       WRITE (8,174)
  174  FORMAT ('44 = Bias in environmental assessment')
       WRITE (8,175)
  175  FORMAT ('45 = Error in environmental assessmemt')
	 WRITE (8,74)
   74  FORMAT ('46 = Number of population crashes')
       WRITE (8,27)
   27  FORMAT ('47 = Mean fitness across demes at equilibrium')
       WRITE (8,30)
   30  FORMAT ('48 = Mean of non-plastic loci - trait 1, 49 = SE')
       WRITE (8,3022)
 3022  FORMAT ('50 = Mean of non-plastic loci - trait 2, 51 = SE') 
       WRITE (8,31)
   31  FORMAT ('52 = Mean of plastic loci - trait 1, 53 = SE') 
       WRITE (8,312)
  312  FORMAT ('54 = Mean of plastic loci - trait 2, 55 = SE') 
       WRITE (8,131)
  131  FORMAT ('56 = Mean of develop noise loci - trait 1, 57 = SE') 
       WRITE (8,1322)
 1322  FORMAT ('58 = Mean of develop noise loci - trait 2, 69 = SE') 
       WRITE (8,32)
   32  FORMAT ('60 = Mean of migration loci, 61 = SE') 
       WRITE (8,33)
   33  FORMAT ('62 = Correl of non-plastic - traits 1 & 2, 63 = SE')
       WRITE (8,331)
  331  FORMAT ('64 = Correl of non-plast & plast - trait 1, 65 = SE')
       WRITE (8,332)
  332  FORMAT ('66 = Correl of non-plast - T1 & plast - T2, 67 = SE')
       WRITE (8,333)
  333  FORMAT ('68 = Correl of non-plast - T2 & plast - T1, 69 = SE')
       WRITE (8,334)
  334  FORMAT ('70 = Correl of non-plast & plast - trait 2, 71 = SE')
       WRITE (8,335)
  335  FORMAT ('72 = Correl of plastic - traits 1 & 2, 73 = SE')
       WRITE (8,36)
   36  FORMAT ('74 = SD within-ind non-plastic loci - trait 1, 75 = SE')        
       WRITE (8,37)
   37  FORMAT ('76 = SD among-ind non-plastic loci - trait 1, 77 = SE')
       WRITE (8,362)
  362  FORMAT ('78 = SD within-ind non-plastic loci - trait 2, 79 = SE')        
       WRITE (8,372)
  372  FORMAT ('80 = SD among-ind non-plastic loci - trait 2, 81 = SE')        
       WRITE (8,38)
   38  FORMAT ('82 = SD within-ind plastic loci - trait 1, 83 = SE')        
       WRITE (8,39)
   39  FORMAT ('84 = SD among-ind plastic loci - trait 1, 85 = SE')  
       WRITE (8,382)
  382  FORMAT ('86 = SD within-ind plastic loci - trait 2, 87 = SE')        
       WRITE (8,392)
  392  FORMAT ('88 = SD among-ind plastic loci - trait 2, 89 = SE')        
       WRITE (8,381)
  381  FORMAT ('90 = SD within-individ noise loci - trait 1, 91 = SE')        
       WRITE (8,391)
  391  FORMAT ('92 = SD among-individ noise loci - trait 1, 93 = SE')   
       WRITE (8,3812)
 3812  FORMAT ('94 = SD within-individ noise loci - trait 2, 95 = SE')        
       WRITE (8,3912)
 3912  FORMAT ('96 = SD among-individ noise loci - trait 2, 97 = SE')    
       WRITE (8,40)
   40  FORMAT ('98 = SD within-individual migration loci, 99 = SE')        
       WRITE (8,41)
   41  FORMAT ('100 = SD among-individual migration loci, 101 = SE') 
       WRITE (8,42)
   42  FORMAT ('102 = Mean phenotype - trait 1, 103 = SE')        
       WRITE (8,43)
   43  FORMAT ('104 = SD of mean phenotype - trait 1, 105 = SE') 
       WRITE (8,422)
  422  FORMAT ('106 = Mean phenotype - trait 2, 107 = SE')        
       WRITE (8,432)
  432  FORMAT ('108 = SD of mean phenotype - trait 2, 109 = SE') 
       WRITE (8,433)
  433  FORMAT ('110 = Mean amount of habitat construction, 111 = SE')   
       WRITE (8,434)
  434  FORMAT ('112 = SD of mean habitat construction, 113 = SE')     
       WRITE (8,441)
  441  FORMAT ('114 = Slope of non-plastic loci - trait 1, 115 = SE')
       WRITE (8,442)
  442  FORMAT ('116 = Slope of non-plastic loci - trait 2, 117 = SE') 
       WRITE (8,443)
  443  FORMAT ('118 = Slope of mean phenotype - trait 1, 119 = SE')        
       WRITE (8,444)
  444  FORMAT ('120 = Slope of mean phenotype - trait 2, 121 = SE') 
       WRITE (8,445)
  445  FORMAT ('122 = Slope of mean habitat construction, 123 = SE')       
       WRITE (8,45)
       WRITE (8,44)
   44  FORMAT ('THE EQUILIBRIUM DATA ARE:')
   45  FORMAT ('    ')
       RETURN
       END
!
!
!
! ******** THIS SUBROUTINE OUTPUTS MEAN METAPOPULATION *******
! ******** VALUES FOR EACH PARAMETER SET     *******
       SUBROUTINE MPOUTER(NSH,MS,GRAD1,GRAD2,SLOPE1,SLOPE2,MR,OUTSMP,
     C             MEANFIT,NCRASH,NPARAM,BIASM,BIASPL,NM1LOCI,NM12LOCI,
     C              NM2LOCI,NP1LOCI,NP12LOCI,NP2LOCI,ND1LOCI,ND2LOCI,
     C              NMIGL,LINKAGE,VMLOCI,VPLLOCI,ENOISE1,ENOISE2,
     C             COST1,COST2,HABCOST,CNOISE1,CNOISE2,BEFORE1,BEFORE2,
     C              AFTER1,AFTER2,TCONSTR,SPCORR1,SPCORR2,STABIL1,
     C               STABIL2,RDEVEL1,RDEVEL2,FBIAS,FUZ,CM,NGSTEP,
     C               NPSTEP,DECHAB)
       REAL MR,MEANFIT,OUTSMP((2*NPARAM)),LINKAGE
       INTEGER BIAS,VMLOCI,VPLLOCI,BEFORE1,BEFORE2,AFTER1
       INTEGER AFTER2,SPCORR1,SPCORR2,TCONSTR
       INTEGER*4 J
       WRITE (8,93) NSH,MS,NM1LOCI,NM12LOCI,NM2LOCI,NP1LOCI,NP12LOCI,
     C            NP2LOCI,ND1LOCI,ND2LOCI,NMIGL,LINKAGE,VMLOCI,VPLLOCI,
     C            GRAD1,GRAD2,SLOPE1,SLOPE2,NGSTEP,NPSTEP,BIASM,BIASPL,
     C              MR,BEFORE1,BEFORE2,AFTER1,AFTER2,TCONSTR,DECHAB,
     C              CNOISE1,CNOISE2,ENOISE1,ENOISE2,SPCORR1,SPCORR2,
     C              STABIL1,STABIL2,RDEVEL1,RDEVEL2,COST1,COST2,CM,
     C              HABCOST,FBIAS,FUZ,NCRASH,MEANFIT,(OUTSMP(J),J=1,78)  
93     FORMAT (11I4,1X,F5.2,2I3,2(1X,F5.1),2(1X,F5.2),2I4,2(1X,F4.2),
     C         1X,F5.3,5I4,5(1X,F5.2),2I4,4(1X,F4.2),6(1X,F6.4),
     C         1X,I3,1X,F6.3,78(1X,F9.5))      
       RETURN
       END
!
!
!
! ******* THIS SUBROUTINE TELLS YOU WHERE THE PROGRAM IS AT **********
       SUBROUTINE WHEREAT(MS,MR,NGEN,MEANFIT,NREP,NMLOCI,NPLOCI,
     C                    NDLOCI,NMIGL,GRAD,SLOPE,CNOISE,ENOISE,COST,
     C                    DECHAB,STABIL,RDEVEL,BIASPL,FBIAS,FUZ,CM)
       REAL MR,MEANFIT,LINKAGE  
       WRITE (*,92) MS,NMLOCI,NPLOCI,NMIGL,MR,DECHAB,CNOISE,
     C         ENOISE,CM,COST,STABIL,RDEVEL,BIASPL,NGEN,MEANFIT,NREP
92     FORMAT (I2,3I3,4(1X,F5.2),2(1X,F5.3),3(1X,F4.2),I6,1X,
     C         F4.3,I3)
       RETURN
       END
