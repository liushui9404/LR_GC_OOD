
for id_ratio in 0.25 0.75
do
  for split_id in 0 1 2 3 4
  do
    echo "Running Discriminative Classifier"
    dname="snips" 
    
    #python train.py --epochs=30 --batch_size=8  --gpu=2 --dataset=${dname}  --unsup  --id_ratio=${id_ratio} --split_id=${split_id}   --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=discriminativeClassifiers/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain --hendrycks --oodT=1000  --super_root="/home/vgangal/OOD_Detect_NLP/" &> discriminative_classifier_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain
    
    #python train.py --epochs=30 --batch_size=8  --gpu=2 --dataset=${dname}  --unsup  --id_ratio=${id_ratio} --split_id=${split_id}   --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=discriminativeClassifiers/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain/best_snapshot.pt --hendrycks --oodT=1000  --super_root="/home/vgangal/OOD_Detect_NLP/" --infer_only | tee inference_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_hendrycks_oodT=1000

    #python train.py --epochs=30 --batch_size=8  --gpu=2 --dataset=${dname}  --unsup  --id_ratio=${id_ratio} --split_id=${split_id}   --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=discriminativeClassifiers/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain/best_snapshot.pt --hendrycks --oodT=1  --super_root="/home/vgangal/OOD_Detect_NLP/" --infer_only | tee inference_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_hendrycks_oodT=1

    #python train.py --epochs=30 --batch_size=8  --gpu=2 --dataset=${dname}  --unsup  --id_ratio=${id_ratio} --split_id=${split_id}   --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=discriminativeClassifiers/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain/best_snapshot.pt --kldPrune --oodT=1  --super_root="/home/vgangal/OOD_Detect_NLP/" --infer_only | tee inference_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_kldPrune

    #python train.py --epochs=30 --batch_size=8  --gpu=2 --dataset=${dname}  --unsup  --id_ratio=${id_ratio} --split_id=${split_id}   --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=discriminativeClassifiers/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain/best_snapshot.pt --ratioKldPrune --oodT=1  --super_root="/home/vgangal/OOD_Detect_NLP/" --infer_only | tee inference_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_ratioKldPrune

    #contamination=0.05
    #python train.py --epochs=30 --batch_size=8  --gpu=2 --dataset=${dname}  --unsup  --id_ratio=${id_ratio} --split_id=${split_id}   --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=discriminativeClassifiers/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain/best_snapshot.pt --ratioKldPrune --oodT=1  --super_root="/home/vgangal/OOD_Detect_NLP/" --infer_only --returnIntermediate --lof --contamination=${contamination} | tee inference_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_lof_returnIntermediate_contamination=${contamination}

     #echo "Training  Plain LM, Various Sizes" 
     #for backInputSize in 128 256
     #do
     #  python train.py  --epochs=7  --batch_size=8 --gpu=2 --dataset=${dname}  --unsup --generative --id_ratio=${id_ratio} --split_id=${split_id}  --fore_lm --back_input_size ${backInputSize} --no-bidirectional  --marginal  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backInputSize=${backInputSize} --super_root="/home/vgangal/OOD_Detect_NLP/"  | tee generative_classifier_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backInputSize=${backInputSize}
     #done


     #echo "Training  Plain LM With Background, Various Sizes, Uniform and Unigram" 
     #for noiseType in uniform unigram uniroot
     #do
     #  for noiseLevel in 0.5
     #  do
     #    for backInputSize in 256
     #    do
     #      python train.py  --epochs=7  --batch_size=8 --gpu=2 --dataset=${dname}  --unsup --generative --id_ratio=${id_ratio} --split_id=${split_id}  --fore_lm --back_input_size ${backInputSize} --no-bidirectional  --marginal --back_lm --corrupt_back --noise_level ${noiseLevel} --noise_type=${noiseType}  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backLm_backInputSize=${backInputSize}_corruptBack_noiseLevel=${noiseLevel}_noiseType=${noiseType} --super_root="/home/vgangal/OOD_Detect_NLP/"  | tee generative_classifier_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backLm_backInputSize=${backInputSize}_corruptBack_noiseLevel=${noiseLevel}_noiseType=${noiseType}
     #    done
     #  done
     #done

     #echo "Training Generative Classifier Without any Background"
     #python train.py  --epochs=15  --batch_size=8 --gpu=2 --dataset=${dname} --unsup --generative --id_ratio=${id_ratio} --split_id=${split_id}   --no-bidirectional --at_hidden  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden --marginal --oodT=1 --super_root="/home/vgangal/OOD_Detect_NLP/"  | tee generative_classifier_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden

     echo "Training Generative Classifier With Backgrounds"
     for noiseType in uniform unigram uniroot
     do
       echo "${noiseType}"
       for noiseLevel in 0.5
       do
         for backInputSize in 64
         do
     	     python train.py  --epochs=15  --batch_size=8 --gpu=2 --dataset=${dname} --unsup --generative --id_ratio=${id_ratio} --split_id=${split_id} --no-bidirectional --at_hidden  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=${backInputSize}_corruptBack_noiseLevel=${noiseLevel}_noiseType=${noiseType} --marginal --back_lm --back_input_size=${backInputSize} --corrupt_back --noise_level=${noiseLevel} --noise_type=${noiseType} --oodT=1 --super_root="/home/vgangal/OOD_Detect_NLP/"  | tee  generative_classifier_logs/oodExp3007_${dname}_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=${backInputSize}_corruptBack_noiseLevel=${noiseLevel}_noiseType=${noiseType} 
         done
       done
     done



    #for margin in 0.01 0.05 0.1 0.15 0.30 0.60 1.20 1.50 3.0 6.0
    #do
    #  python train.py --epochs=15 --batch_size=8  --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup  --short_circuit_main --cosine_softmax --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=discriminativeClassifiers/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_cosineSoftmax --returnIntermediate --margin=${margin} --hendrycks --oodT=1000 &> logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_cosineSoftmax_margin=${margin}_hendrycks_oodT=1000
    #done

    #python train.py --epochs=15 --batch_size=8  --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup  --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=discriminativeClassifiers/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain &> logs/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain
    #python train.py --epochs=15 --batch_size=8  --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup  --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=discriminativeClassifiers/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain  --returnIntermediate --mahalanobis &> logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_returnIntermediate_mahalanobis
    #python train.py --epochs=15 --batch_size=8  --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup  --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=discriminativeClassifiers/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain/best_snapshot.pt  --returnIntermediate --emdPrune --oodT=1 --infer_only &> logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain_returnIntermediate_emdPrune
      #echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal &> logs/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal
    #echo "Running Plain LM and Marginal for ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative --fore_lm --back_input_size 64 --no-bidirectional  --marginal  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backInputSize=64 &> generative_classifier_logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backInputSize=64
    #echo "Running Plain LM and Background-LM for ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative --fore_lm --back_input_size 64 --no-bidirectional  --marginal --back_lm --corrupt_back --noise_level=0.5 --noise_type=uniroot  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot &> generative_classifier_logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_marginal_foreLm_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot
    #echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id} And Using Hendrycks"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --hendrycks  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_hendrycks --oodT=1000 &> generative_classifier_logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_hendrycks
    #echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id} and Scrambled Background"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --scramble  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal &> generative_classifier_logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_scramble
    #echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id} and Scrambled Background+BackgroundLM"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --back_lm --corrupt_back --noise_level=0.5 --noise_type=uniroot --back_input_size=64 --scramble  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot_withMasking_scramble &> generative_classifier_logs/oodExp3007_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot_withMasking_scramble
    #echo "Running Generative Classifier + Background LM  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --back_lm --corrupt_back --noise_level=0.5 --noise_type=uniroot --back_input_size=64 --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot &> logs/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot_withMasking
    #echo "Running Generative Classifier + Background LM With Diff Training  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --back_lm --back_lm_diff --corrupt_back --noise_level=0.5 --noise_type=uniroot --back_input_size=64 --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backLmDiff_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot &> logs/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backLmDiff_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot
    #echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal &> logs/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal
    #echo "Running Generative Classifier + Background Mirror  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --back_mirror --corrupt_back --noise_level=0.5 --noise_type=uniroot --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backMirror_corruptBack_noiseLevel=0.5_noiseType=uniroot &> logs/oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backMirror_corruptBack_noiseLevel=0.5_noiseType=uniroot 
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden    --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal/best_snapshot.pt --infer_only --hendrycks --oodT=1000
    #python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="snips" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden    --word_vectors=vector_cache/glove.6B.100d.txt.p  --resume_snapshot=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_snips_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal/best_snapshot.pt --infer_only --tentropy
  done
done
