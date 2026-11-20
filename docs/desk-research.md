# Desk research

The series stands on two bodies of reading: the papers that define how robot policies use, or skip, a model of the
future, and the public record of the companies that sell world models. This page records what each work establishes,
where it stops, and what the series takes from it.

## The short version

| Work | What it establishes | Where it stops | What the series takes |
| --- | --- | --- | --- |
| Ha and Schmidhuber, [World Models](https://arxiv.org/abs/1803.10122) (2018); Hafner et al., [Dreamer](https://arxiv.org/abs/1912.01603) (2019), [DreamerV3](https://arxiv.org/abs/2301.04104) (2023) | A learned model of the environment can train a policy inside its own imagination | Simulated and game environments; foresight is assumed to be worth its compute | The first half of the core tension: foresight is the densest signal a policy can learn from |
| Brohan et al., [RT-2](https://arxiv.org/abs/2307.15818) (2023); Kim et al., [OpenVLA](https://arxiv.org/abs/2406.09246) (2024) | Web-scale vision-language knowledge transfers to robot control | Actions as discrete tokens; no model of how the scene will change | The semantic route, and the question of what a semantic representation leaves out |
| Black et al., [π₀](https://arxiv.org/abs/2410.24164) (2024) | A VLM backbone joined to a continuous flow-matching action expert, trained across embodiments | Weak causal attribution among data, recipe and architecture | The interface between semantics and control as the object worth studying |
| Hu et al., [VPP](https://arxiv.org/abs/2412.14803) (2024); Ye et al., [DreamZero](https://arxiv.org/abs/2602.15922) (2026); Yuan et al., [Fast-WAM](https://arxiv.org/abs/2603.16666) (2026); Ye et al., [GigaWorld-Policy](https://arxiv.org/abs/2603.17240) (2026) | Four ways to use future video: predictive features, joint generation, training-only co-modeling, a causally separated branch | Each paper argues for its own point on the trade, under its own label | The spectrum of where the future enters |
| NVIDIA, [Cosmos](https://arxiv.org/abs/2501.03575) (2025); Assran et al., [V-JEPA 2](https://arxiv.org/abs/2506.09985) (2025) | World models as downloadable platforms and as self-supervised predictors that can plan | Capability, not adoption | The self-hosted supply path, and the version-ownership discipline of the market study |
| World Labs, Odyssey, Runway, Decart and NVIDIA product pages, prices, licenses and terms | How world models are offered: priced APIs, controlled previews, downloads | Vendor and partner statements; no customer-confirmed paid deployment | The three supply paths, and the gap between callable and bought |

## Notes

### The world-model line

Ha and Schmidhuber's *World Models* compressed observations into a latent space, learned its dynamics with a
recurrent model, and trained a small controller inside the learned dream. Dreamer turned that into a general agent
that learns behaviors by imagining trajectories in latent space, and DreamerV3 showed one configuration mastering
very different domains. The line establishes that a model of the future is a powerful training signal. It was built
in simulators and games, where waiting for the model costs nothing. A robot in the physical world waits for every
millisecond of prediction, and that cost is the other half of the tension the series starts from.

### The semantic route: RT-2, OpenVLA and π₀

RT-2 showed that a vision-language model fine-tuned to emit actions as tokens carries web knowledge into robot
control; OpenVLA made the recipe open. Both treat actions as discrete tokens and predict nothing about how the scene
will evolve. π₀ changed the action side: a continuous action expert trained with conditional flow matching, sharing
attention with a pretrained vision-language backbone, generating 50-step chunks and executing them in a receding
horizon. Its weakness as evidence is attribution: the paper changes data, recipe and architecture together, so it
cannot say which one earns the result. Its strength is structural, and the analysis argues it is the part that
lasts: an interface that lets general semantics condition continuous control.

### The world-action route

Video Prediction Policy encodes the current scene with a video diffusion model and conditions a diffusion policy on
one forward pass of predictive features, without rendering a future video. DreamZero generates future video and
actions jointly from a video diffusion backbone. Fast-WAM keeps video co-training as a learning signal and, at
deployment, removes iterative future generation while keeping a single-pass world encoder; its controlled
comparisons attribute much of the value to the training objective. GigaWorld-Policy predicts actions first and
masks future-video tokens out of the action path, so the video branch can be switched off at inference. Read
separately, each paper argues for its own design under its own label. Read together, they are four points on one
axis, which is what the comparison article draws.

### Platforms: Cosmos and V-JEPA 2

NVIDIA's Cosmos platform releases world foundation models as downloadable, self-hostable components for physical AI.
Meta's V-JEPA 2 learns from video without pixels as targets and shows prediction and planning in latent space. Both
establish capability at scale. Neither establishes adoption, and both change versions quickly, which is why the
market study registered every version and component separately and let no component borrow another's access or
license status.

### The market record

The five focus companies of the market study, World Labs, Odyssey, Runway, Decart and NVIDIA Cosmos 3, publish
product pages, price lists, licenses, terms and partner announcements. These establish how capability is offered:
publicly priced interfaces, application-controlled previews and self-hosted downloads. They do not establish who
pays. Across 141 registered sources the study found no customer-first-party confirmation of paid production use,
renewal or revenue for any of the five, and that absence is a finding: the competition has moved from model quality
to delivery units, validation, rights and cost.

## What the series adds

1. **One axis for a split field.** Three questions, about what is predicted, what reaches the actor and what runs at
   deployment, place every model on one spectrum, whatever its label.
2. **An interface reading of π₀.** The seam between semantics and control, followed from the flow-matching objective
   to the execution loop.
3. **A market study held to its evidence.** Four separate verdicts, claims traced one by one to sources, and a
   strategy built for a market that is callable and not yet bought.
