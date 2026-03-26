--
-- PostgreSQL database dump
--

-- Dumped from database version 17.5
-- Dumped by pg_dump version 17.5

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, username, email, password, first_name, last_name, phone_number, enabled, account_non_expired, account_non_locked, credentials_non_expired, failed_login_attempts, last_login, password_changed_at, created_at, updated_at, created_by, updated_by, title, date_of_birth, nationality, email_verified) FROM stdin;
24	super.admin	super.admin@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Super	Admin	\N	t	t	t	t	0	2025-12-08 15:14:07.560858	\N	2025-12-08 05:08:57.249755	2025-12-08 15:14:07.59882	SYSTEM	\N	\N	\N	\N	t
3	annguyen	an.nguyen@mirrorfuturediamond.com	$2a$12$Fjuz1xcNGr0UzjdaHMv2pedZbfazfIYFWZrr5rU8p/6xBEoC9XvoS	An	Nguyen		t	t	t	t	0	2025-08-28 09:44:37.828142	2025-08-12 06:35:25.686991	2025-08-12 06:35:25.686977	2025-08-28 09:44:38.05909	SYSTEM	annguyen	\N	\N	Vietnam	f
23	dangnam1838	dangnam1838@outlook.com.vn	$2a$12$3T0i7id8qZzeYmRVWCD/7eeO2oBcCoOv23wMJeVYmJGY0psNHG0w2	Nam	Dang	\N	t	t	t	t	0	\N	2025-10-21 04:41:54.018988	2025-10-21 04:41:54.018966	2025-10-21 04:41:54.018983	SYSTEM	SYSTEM	Ms	\N	\N	f
19	dangnam1834	dangnam1834@gmail.com	$2a$12$9W0dOLeYaGIoNhyBtQ72G.m3PeVrm0yWJjMJI92h7nj3xmwI67ocW	Nam	Dang	\N	t	t	t	t	0	2025-10-22 02:46:15.856491	2025-10-20 02:56:20.882087	2025-10-20 02:56:20.882068	2025-10-22 02:46:15.883837	SYSTEM	SYSTEM	\N	\N	\N	t
14	testuser	test@example.com	$2a$12$g6ztkms3cvRihxALr1MwZ.6ReiJHZYDGepjmDdOWJ.QUntQ2nFkbi	Test	User	\N	t	t	t	t	0	2026-01-12 22:39:53.419748	2026-01-12 22:34:41.75019	2026-01-12 22:34:41.750178	2026-01-12 22:39:53.727692	SYSTEM	SYSTEM	Mr	\N	\N	f
7	depquadi	minhtn286@gmail.com	$2a$12$4.IxN39Ktm.EBXX3MjbrTuGTB.RqTmBhVCLHvJjIbxDP6Hsjfirmi	Minh	Tran	\N	t	t	t	t	0	2025-11-12 08:11:24.072385	2025-09-04 07:40:58.996804	2025-09-04 07:40:58.996797	2025-11-12 08:11:24.080336	SYSTEM	SYSTEM	\N	\N	\N	f
29	vendor	vendor@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Vendor	\N	t	t	t	t	0	\N	\N	2025-12-08 05:08:57.528233	2025-12-08 05:08:57.528233	SYSTEM	\N	\N	\N	\N	t
30	designer	designer@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Designer	\N	t	t	t	t	0	\N	\N	2025-12-08 05:08:57.582774	2025-12-08 05:08:57.582774	SYSTEM	\N	\N	\N	\N	t
35	finance	finance@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Finance	\N	t	t	t	t	0	2025-12-08 15:06:35.360181	\N	2025-12-08 05:08:57.934211	2025-12-08 15:06:35.445452	SYSTEM	\N	\N	\N	\N	t
15	testuser123	test123@example.com	$2a$12$VI.gLKnPEoXo.V0qS9/eseI/DOz2RmDY4Q6BZCxehL8IfQrKOsS8e	Test	User	\N	t	t	t	t	0	2026-01-12 23:18:34.666267	2026-01-12 23:07:07.22862	2026-01-12 23:07:07.228607	2026-01-12 23:18:34.792668	SYSTEM	SYSTEM	Mr	\N	\N	f
20	dangnam1836	dangnam1834@outlook.com.vn	$2a$12$rl5aflarh//aLkdisw235uqPcvv/knLe9dZJ6av8wG4MAzGqXVvBi	Nam	Dang	\N	t	t	t	t	0	\N	2025-10-20 03:22:23.35484	2025-10-20 03:22:23.35483	2025-10-20 03:22:23.354839	SYSTEM	SYSTEM	\N	\N	\N	f
8	designer1	designer1@mirror.com	$2a$12$KQ2VO.rmxIHsaRlkl7XCheCeB6e0tsJO5yGLIUCVDBMtkHByM3qCW	Jane	Designer	+84123456789	t	t	t	t	0	2025-11-12 08:23:50.105144	2025-10-01 17:44:32.556006	2025-10-01 17:44:32.555987	2025-11-12 08:23:50.110396	minhtran	minhtran	\N	\N	\N	f
26	it.admin	it.admin@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	IT	Admin	\N	t	t	t	t	0	2025-12-08 15:05:54.484229	\N	2025-12-08 05:08:57.36825	2025-12-08 15:05:54.566773	SYSTEM	\N	\N	\N	\N	t
5	doanpham	doan.pham@mirrorfuturediamond.com	$2a$12$Um8TP2LhJV2au6gneHpNQej5RmJRm5gk66u6qgLray6q.Y99Q.nMG	Đoan	Phạm	\N	t	t	t	t	0	2025-08-29 05:17:52.648416	2025-08-27 09:54:32.072239	2025-08-27 09:54:32.072229	2025-08-29 05:17:52.65313	SYSTEM	SYSTEM	\N	\N	\N	f
31	creative.design	creative@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Creative	Design	\N	t	t	t	t	0	2025-12-08 15:07:02.278786	\N	2025-12-08 05:08:57.711721	2025-12-08 15:07:02.372908	SYSTEM	\N	\N	\N	\N	t
22	ngtt_hien	nguyenhien1242002@gmail.com	$2a$12$mSOkRcmwNKDSVjev6PaqfOm8n4nbI1OozpsDsjmU1AIeKMRcY7Lle	Nguyễn	Hiền	\N	t	t	t	t	0	2025-11-05 06:54:07.602958	2025-10-21 03:45:14.006286	2025-10-21 03:45:14.006278	2025-11-05 06:54:07.656511	SYSTEM	SYSTEM	\N	\N	\N	t
28	customer	customer@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Customer	\N	t	t	t	t	0	2025-12-08 15:07:29.425468	\N	2025-12-08 05:08:57.475809	2025-12-08 15:07:29.51071	SYSTEM	\N	\N	\N	\N	t
32	marketing	marketing@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Marketing	\N	t	t	t	t	0	2025-12-08 15:06:48.395762	\N	2025-12-08 05:08:57.763802	2025-12-08 15:06:48.489477	SYSTEM	\N	\N	\N	\N	t
36	legal	legal@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Legal	\N	t	t	t	t	0	2025-12-08 15:07:15.600004	\N	2025-12-08 05:08:57.986766	2025-12-08 15:07:15.709902	SYSTEM	\N	\N	\N	\N	t
33	production.ops	production@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Production	Ops	\N	t	t	t	t	0	2025-12-11 13:32:23.230113	\N	2025-12-08 05:08:57.816251	2025-12-11 13:32:23.314362	SYSTEM	\N	\N	\N	\N	t
34	sales.ops	sales@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Sales	Ops	\N	t	t	t	t	0	2025-12-11 13:33:41.323179	\N	2025-12-08 05:08:57.868802	2025-12-11 13:33:41.404037	SYSTEM	\N	\N	\N	\N	t
27	standard.user	user@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Standard	User	\N	t	t	t	t	0	2026-02-06 03:23:38.070836	\N	2025-12-08 05:08:57.421778	2026-02-06 03:23:38.086235	SYSTEM	\N	\N	\N	\N	t
55	luxe.saigon_partner	luxe.saigon@mirror.vn	$2a$12$kmN8nsiWALqzhFwD3pwMHO/eRWvYt.T90offu6kfmp41zT2KGbhFC	Nguyen	Van A	+84 901 234 567	t	t	t	t	0	2026-01-28 09:42:16.009522	2026-01-27 07:12:03.790043	2026-01-27 07:12:03.790029	2026-01-28 09:42:16.448793	SYSTEM	SYSTEM	\N	\N	\N	f
2	namdang	nam.dang@mirrorfuturediamond.com	$2a$12$NmPY2L.tUqZFRBgThNuJ3.nUCjBkabSU5u/kZEq/NQJOv33JwAC1a	Nam	Dang	84888400309	t	t	t	t	0	2026-02-12 09:22:47.539578	2025-08-11 14:07:26.556104	2025-08-11 14:07:26.556104	2026-02-12 09:22:47.624746	SYSTEM	namdang	Mr	2003-10-21	\N	f
56	minh.nguyen_partner	minh.nguyen@luxespa.vn	$2a$12$tuIuHy41WEVOBe8hi/kL6OJrMHgGG0FZeSLzXuNDNplbfGjErDYIy	Nguyen	Thi Minh 	+84 909 123 456	t	t	t	t	0	\N	2026-01-27 07:16:36.719904	2026-01-27 07:16:36.719893	2026-01-27 07:16:36.719902	SYSTEM	SYSTEM	\N	\N	\N	f
25	admin	admin@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	System	Admin	\N	t	t	t	t	0	2026-01-22 05:29:53.625331	\N	2025-12-08 05:08:57.315767	2026-01-22 05:29:54.03622	SYSTEM	\N	\N	\N	\N	t
50	contact_partner	contact@diamondhotel.vn	$2a$12$yUEmia6UckGyu5klSWYbxOcUeSGxUqznZMRwXIm/qX1o5UAbQNwyy	Nguyen	Van A	+84901234568	t	t	t	t	0	\N	2026-01-22 04:17:53.472071	2026-01-22 04:17:53.472056	2026-01-22 04:17:53.472069	SYSTEM	SYSTEM	\N	\N	\N	f
53	contact_partner_1	contact@abcspa.vn	$2a$12$hHnDWxRByfw7dXij6IFdT.XDkL3rwfPCEpzwnRdx9Y6YfcRyB/D6i	Tran	Van B	+84909999999	t	t	t	t	0	2026-01-22 05:30:23.052227	2026-01-22 05:29:54.840263	2026-01-22 05:29:54.840246	2026-01-22 05:30:23.112984	SYSTEM	SYSTEM	\N	\N	\N	f
54	phygital.hanoi_partner	phygital.hanoi@mirror.vn	$2a$12$5M.F8WRnf/Yqsc2pzB60mOuKgV7dE/8G8w4aovbNpIFS3iqhYQDwq	Nguyen	Van A	0912345678	t	t	t	t	0	2026-01-27 03:59:29.380991	2026-01-27 03:58:55.86283	2026-01-27 03:58:55.862817	2026-01-27 03:59:29.448032	SYSTEM	SYSTEM	\N	\N	\N	f
51	partner	partner@mirror.vn	$2b$12$jht6w7/Z0esejrZCwkwaNuGSc3Sv5EGeL8ZVOkzBKpJy7Wgl9BN.K	Test	Partner	\N	t	t	t	t	0	2026-01-28 02:38:47.2734	\N	2026-01-22 05:15:43.240968	2026-01-28 02:38:47.276596	SYSTEM	\N	\N	\N	\N	t
4	minhtran	minh.tran@mirrorfuturediamond.com	$2a$12$KQ2VO.rmxIHsaRlkl7XCheCeB6e0tsJO5yGLIUCVDBMtkHByM3qCW	Minh	Tran	840901471135	t	t	t	t	0	2026-02-12 10:42:49.611743	2025-08-13 03:54:54.099803	2025-08-12 07:57:21.414483	2026-02-12 10:42:49.8474	SYSTEM	minhtran	Mr	\N	Vietnam	f
1	tile	ti.le@mirrorfuturediamond.com	$2b$12$arJpOqf6KxTR5riywDJNT.y0yFefWILhg..PeDr/6Jqv9m2oODHOS	Ti	Le	0901471134	t	t	t	t	0	2026-03-26 09:27:35.525598	2025-09-03 03:07:02.62918	2025-08-01 11:34:46.678738	2026-03-26 09:27:35.540339	SYSTEM	tile	Mr	2003-08-30	Vietnam	f
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 56, true);


--
-- PostgreSQL database dump complete
--

