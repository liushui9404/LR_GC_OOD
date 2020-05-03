for id_ratio in 0.25 0.75
do
  for split_id in 0 1 2 3 4
  do
    echo "Running Discriminative Classifier"
    python train.py --epochs=15 --batch_size=8  --gpu=0 --dataset="atis" --id_ratio=${id_ratio} --split_id=${split_id} --unsup  --short_circuit_main --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=discriminativeClassifiers/oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain &> logs/oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_discriminativeClassifierWithGlove_shortcircuitmain
    echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="atis" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal &> logs/oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal
    echo "Running Generative Classifier + Background LM  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="atis" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --back_lm --corrupt_back --noise_level=0.5 --noise_type=uniroot --back_input_size=64 --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot &> logs/oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backLm_backInputSize=64_corruptBack_noiseLevel=0.5_noiseType=uniroot
    echo "Running Generative Classifier Without any Background  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="atis" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal  --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal &> logs/oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal
    echo "Running Generative Classifier + Background Mirror  With in-domain ratio ${id_ratio} and split-id ${split_id}"
    python train.py  --epochs=15  --batch_size=8 --gpu=0 --dataset="atis" --id_ratio=${id_ratio} --split_id=${split_id} --unsup --generative  --no-bidirectional --at_hidden  --marginal --back_mirror --corrupt_back --noise_level=0.5 --noise_type=uniroot --word_vectors=vector_cache/glove.6B.100d.txt.p  --save_path=generativeClassifiersWithBackgrounds/ckpt_oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backMirror_corruptBack_noiseLevel=0.5_noiseType=uniroot &> logs/oodExp0507_atis_unsup_idRatio${id_ratio}_splitId${split_id}_generative_atHidden_marginal_backMirror_corruptBack_noiseLevel=0.5_noiseType=uniroot 
  done
done
