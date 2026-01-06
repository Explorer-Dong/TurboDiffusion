export PYTHONPATH=turbodiffusion

# --image_path              Path to the input image
# --high_noise_model_path   Path to the high noise TurboDiffusion checkpoint
# --low_noise_model_path    Path to the high noise TurboDiffusion checkpoint
# --boundary                Timestep boundary for switching from high to low noise model (default: 0.9)
# --model                   Model to use: Wan2.2-A14B (default: Wan2.2-A14B)
# --num_samples             Number of videos to generate (default: 1)
# --num_steps               Sampling steps, 1–4 (default: 4)
# --sigma_max               Initial sigma for rCM (default: 200); larger choices (e.g., 1600) reduce diversity but may enhance quality
# --vae_path                Path to Wan2.2 VAE (default: checkpoints/Wan2.2_VAE.pth)
# --text_encoder_path       Path to umT5 text encoder (default: checkpoints/models_t5_umt5-xxl-enc-bf16.pth)
# --num_frames              Number of frames to generate (default: 77)
# --prompt                  Text prompt for video generation
# --resolution              Output resolution: "480p" or "720p" (default: 720p)
# --aspect_ratio            Aspect ratio in W:H format (default: 16:9)
# --adaptive_resolution     Enable adaptive resolution based on input image size
# --ode                     Use ODE for sampling (sharper but less robust than SDE)
# --seed                    Random seed for reproducibility (default: 0)
# --save_path               Output file path including extension (default: output/generated_video.mp4)
# --attention_type          Attention module to use: original, sla or sagesla (default: sagesla)
# --sla_topk                Top-k ratio for SLA/SageSLA attention (default: 0.1), we recommend using 0.15 for better video quality
# --quant_linear            Enable quantization for linear layers, pass this if using a quantized checkpoint
# --default_norm            Use the original LayerNorm and RMSNorm of Wan models

python turbodiffusion/inference/wan2.2_i2v_infer.py \
    --model Wan2.2-A14B \
    --low_noise_model_path checkpoints/TurboWan2.2-I2V-A14B-low-720P.pth \
    --high_noise_model_path checkpoints/TurboWan2.2-I2V-A14B-high-720P.pth \
    --resolution 720p \
    --adaptive_resolution \
    --image_path assets/i2v_inputs/i2v_input_0.jpg \
    --prompt "The cat in the photo has taken off its glasses." \
    --num_samples 1 \
    --num_steps 4 \
    --attention_type sagesla \
    --sla_topk 0.15 \
    --ode